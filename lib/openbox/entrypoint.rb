# frozen_string_literal: true

require 'thor'
require 'openbox/runtime'
require 'openbox/command'

module Openbox
  # The Container Entrypoint
  #
  # @since 0.1.0
  class Entrypoint < Thor
    # :nodoc:
    def self.exit_on_failure?
      true
    end

    require 'openbox/commands/server'
    require 'openbox/commands/rake'
    require 'openbox/commands/migrate'
    require 'openbox/commands/seed'
    require 'openbox/commands/console'
    require 'openbox/commands/sidekiq'
  end
end
