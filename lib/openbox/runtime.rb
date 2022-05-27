# frozen_string_literal: true

require 'bundler'

module Openbox
  # Detection application runtime
  #
  # @since 0.1.0
  class Runtime
    # @param dependencies [Array<Bundler::Dependency>]
    #
    # @since 0.1.0
    def initialize(dependencies = [])
      @dependencies = dependencies
    end

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
      @dependencies
        .select { |dep| names.include?(dep.name) && (dep.groups & groups).any? }
    end

    # Check for rubygmes exists
    #
    # @return [TrueClass|FalseClass]
    #
    # @since 0.1.0
    def has?(*names)
      select(*names).any?
    end

    # Groups to detect
    #
    # @return [Array<Symbol>]
    #
    # @since 0.1.0
    def groups
      @groups ||= [:default, ENV.fetch('RAILS_ENV', nil), ENV.fetch('RACK_ENV', nil)].compact.map(&:to_sym)
    end
  end
end
