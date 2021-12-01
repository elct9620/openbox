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
      Bundler
        .definition
        .current_dependencies
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
      @groups ||= [:default, ENV['RAILS_ENV'], ENV['RACK_ENV']].compact.map(&:to_sym)
    end
  end
end
