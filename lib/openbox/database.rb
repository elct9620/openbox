# frozen_string_literal: true

require 'timeout'
require 'uri'

module Openbox
  # The database helper
  #
  # @since 0.1.0
  class Database
    # Supported adpaters
    #
    # @since 0.1.0
    ADAPTERS = %w[pg mysql2].freeze

    # Get all database adapters
    #
    # @return [Array<String>] adapters
    def adapters
      @adapters ||=
        Openbox.runtime.select(*ADAPTERS).map(&:name)
    end

    # @since 0.1.0
    # Ensure database connection
    #
    # @since 0.1.0
    def ensure_connection!
      return unless Openbox.runtime.has?(*ADAPTERS)

      puts 'Check database connection...'
      send("connect_#{adapters.first}")
    rescue Timeout::Error
      puts 'Unable connect database'
      exit 1
    end

    private

    # @since 0.1.0
    def connect_pg
      require 'pg'

      retry_in(timeout: 30) do
        PG.connect(ENV.fetch('DATABASE_URL', nil))
      end
    end

    # @since 0.1.0
    def connect_mysql2
      require 'mysql2'

      uri = URI.parse(ENV.fetch('DATABASE_URL', nil))
      username, password = uri.userinfo.split(':', 2)
      port = uri.port || 3306
      connect_attrs = URI.decode_www_form(uri.query || '').to_h
      retry_in(timeout: 30) do
        Mysql2::Client.new(username: username, password: password, host: uri.host,
                           database: uri.path[1..-1], port: port, connect_attrs: connect_attrs)
      end
    end

    # @since 0.1.0
    def retry_in(timeout: 30)
      Timeout.timeout(timeout) do
        yield
      rescue StandardError
        sleep 1
        retry
      end
    end
  end
end
