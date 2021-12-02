# frozen_string_literal: true

module Openbox
  # :nodoc:
  module Commands
    # The Rake Command
    #
    # @since 0.1.0
    class Rake < Openbox::Command
      # Run rake task with database connection check
      #
      # @since 0.1.0
      def execute
        Openbox.database.ensure_connection!
        exec("bundle exec rake #{args.join(' ')}")
      end
    end

    Openbox::Entrypoint.register(Rake, 'rake', 'rake', 'Run rake task') if Openbox.runtime.has?('rails', 'rake')
  end
end
