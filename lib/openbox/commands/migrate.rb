# frozen_string_literal: true

module Openbox
  # :nodoc:
  module Commands
    # The Migrate Command
    #
    # @since 0.1.0
    class Migrate < Openbox::Command
      # Run rails migrate
      #
      # @since 0.1.0
      def execute
        Openbox.database.ensure_connection!
        exec('bundle exec rails db:migrate')
      end
    end

    Openbox::Entrypoint.register(Migrate, 'migrate', 'migrate', 'Run rails migrate') if Openbox.runtime.has?('rails')
  end
end
