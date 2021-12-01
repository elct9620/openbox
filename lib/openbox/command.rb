# frozen_string_literal: true

require 'thor'
require 'openbox/runtime'

module Openbox
  # The Container Entrypoint
  #
  # @since 0.1.0
  class Command < Thor
    # @since 0.1.0
    desc 'server', 'Start Application Server'
    def server
      Openbox.database.ensure_connection!
      return exec('bundle exec rails server') if Openbox.runtime.rails?

      exec('bundle exec rackup -o 0.0.0.0')
    end

    def self.exit_on_failure?
      true
    end
  end
end
