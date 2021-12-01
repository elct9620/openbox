# frozen_string_literal: true

require 'bundler'

module Openbox
  # Detection application runtime
  #
  # @since 0.1.0
  class Runtime
    def rails?
      has?('rails')
    end

    def select(*names)
      Bundler
        .definition
        .dependencies
        .select { |dep| names.include?(dep.name) }
    end

    def has?(*names)
      select(*names).any?
    end
  end
end
