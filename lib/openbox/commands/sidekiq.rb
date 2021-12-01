# frozen_string_literal: true

module Openbox
  # :nodoc:
  module Commands
    # The Sidekiq Command
    #
    # @since 0.1.0
    class Sidekiq < Openbox::Command
      # Run sidekiq
      #
      # @since 0.1.0
      def execute
        Openbox.database.ensure_connection!
        exec('bundle exec sidekiq')
      end
    end

    Openbox::Entrypoint.register(Sidekiq, 'sidekiq', 'sidekiq', 'Run rails sidekiq') if Openbox.runtime.has?('sidekiq')
  end
end
