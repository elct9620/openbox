# frozen_string_literal: true

require 'thor'

module Openbox
  # The base command of openbox
  #
  # @since 0.1.0
  class Command < Thor::Group
    # Execute command
    #
    # @since 0.1.0
    def execute
      raise NotImplementedError
    end
  end
end
