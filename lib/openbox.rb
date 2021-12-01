# frozen_string_literal: true

require_relative 'openbox/version'
require_relative 'openbox/database'
require_relative 'openbox/runtime'
require_relative 'openbox/command'

# The tool to build Ruby container easier
#
# @since 0.1.0
module Openbox
  LOCK = Mutex.new

  module_function

  # @return [Openbox::Runtime]
  #
  # @since 0.1.0
  def runtime
    return @runtime if @runtime

    LOCK.synchronize do
      dependencies = if defined?(Bundler)
                       Bundler.definition.current_dependencies
                     else
                       []
                     end
      @runtime ||= Runtime.new(dependencies)
    end
  end

  # @return [Openbox::Database]
  #
  # @since 0.1.0
  def database
    return @database if @database

    LOCK.synchronize do
      @database ||= Database.new
    end
  end
end
