# frozen_string_literal: true

module Openbox
  # :nodoc:
  module Commands
    # The Seed Command
    #
    # @since 0.1.0
    class Seed < Openbox::Command
      # Run rails seed
      #
      # @since 0.1.0
      def execute
        Openbox.database.ensure_connection!
        exec('bundle exec rails db:seed')
      end
    end

    Openbox::Entrypoint.register(Seed, 'seed', 'seed', 'Run rails seed') if Openbox.runtime.has?('rails')
  end
end
