# frozen_string_literal: true

require 'bundler'

module Openbox
  # Detection application runtime
  #
  # @since 0.1.0
  class Runtime
    # Check for Rails environment
    #
    # @return [TrueClass|FalseClass]
    #
    # @since 0.1.0
    def rails?
      has?('rails')
    end

    # Select desired rubygems
    #
    # @return [Array<Bundler::Dependency>]
    #
    # @since 0.1.0
    def select(*names)
      # TODO: Select depend on RAILS_ENV or RACK_ENV
      Bundler
        .definition
        .current_dependencies
        .select { |dep| names.include?(dep.name) && dep.groups.include?(:default) }
    end

    # Check for rubygmes exists
    #
    # @return [TrueClass|FalseClass]
    #
    # @since 0.1.0
    def has?(*names)
      select(*names).any?
    end
  end
end
