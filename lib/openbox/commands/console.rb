# frozen_string_literal: true

module Openbox
  # :nodoc:
  module Commands
    # The Console Command
    #
    # @since 0.1.0
    class Console < Openbox::Command
      # Run rails console
      #
      # @since 0.1.0
      def execute
        Openbox.database.ensure_connection!
        exec('bundle exec rails console')
      end
    end

    Openbox::Entrypoint.register(Console, 'console', 'console', 'Run rails console') if Openbox.runtime.has?('rails')
  end
end
