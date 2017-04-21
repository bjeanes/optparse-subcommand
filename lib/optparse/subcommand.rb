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

        alias_method :summarize_without_subcommand, :summarize
        alias_method :summarize, :summarize_with_subcommand
        public :summarize
      end
    end

    def parse_with_subcommand!(*args)
      subcommand = catch(:subcommand) do
        return order!(*args) { |sub| throw :subcommand, sub }
      end

      sub_parser = subcommands[subcommand.to_s]
      if sub_parser
        sub_parser.call.parse!(*args)
      else
        args.first.unshift(subcommand)
      end
    end

    def summarize_with_subcommand(to = [], width = @summary_width, max = width - 1, indent = @summary_indent, &blk)
      summarize_without_subcommand(to, width, max, indent, &blk)
      subcommands.each do |key, sub_parser|
        to << "\n#{indent}#{key}\n"
        sub_parser.call.summarize(to, width, max, indent + "  ", &blk)
      end
      to
    end

    def subcommands
      @subcommands ||= {}
    end
  end

  include Subcommand
end

