require 'optparse'

class OptionParser
  module Subcommand
    def subcommand(key, &block)
      subcommand = lambda { OptionParser.new(&block) }
      subcommands[key.to_s] = subcommand
    end

    private

    def self.included(klass)
      klass.instance_eval do
        alias_method :parse_without_subcommand!, :parse!
        alias_method :parse!, :parse_with_subcommand!
        public :parse!
      end
    end

    def parse_with_subcommand!(argv = default_argv)
      subcommand = catch(:subcommand) do
        return order!(argv) { |sub| throw :subcommand, sub }
      end

      sub_parser = subcommands[subcommand.to_s]
      sub_parser.call.send(:parse!, argv) if sub_parser
    end

    def subcommands
      @subcommands ||= {}
    end
  end

  include Subcommand
end

