# frozen_string_literal: true

module Openbox
  # :nodoc:
  module Commands
    # The Server Command
    #
    # @since 0.1.0
    class Server < Openbox::Command
      # Run Application Server
      #
      # @since 0.1.0
      def execute
        Openbox.database.ensure_connection!
        invoke Migrate unless ENV['AUTO_MIGRATION'].nil?
        return exec('bundle exec rails server') if Openbox.runtime.rails?

        exec('bundle exec rackup -o 0.0.0.0')
      end
    end

    if Openbox.runtime.has?('rails', 'rack')
      Openbox::Entrypoint.register(Server, 'server', 'server', 'Start application server')
    end
  end
end
