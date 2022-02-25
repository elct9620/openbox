# frozen_string_literal: true

require 'thor'
require 'dotenv'

module Openbox
  # The base command of openbox
  #
  # @since 0.1.0
  class Command < Thor::Group
    # Before execute command
    #
    # @since 0.5.0
    def before_execute
      # TODO: Add AWS KMS, Vault support
      return if ENV['SWARM_SECRETS'].nil?

      paths = ENV['SWARM_SECRETS'].split(',').map { |name| "/run/secrets/#{name}" }
      Dotenv.load(*paths)
    end

    # Execute command
    #
    # @since 0.1.0
    def execute
      raise NotImplementedError
    end
  end
end
