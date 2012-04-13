require 'optparse/subcommand'

describe OptionParser do
  def run(args)
    options.parse(args.split(/\s+/))
    hits
  end

  let(:hits) { [] }
  let(:options) do
    OptionParser.new do |opt|
      opt.on '-t' do
        hits << :t
      end

      opt.subcommand 'foo' do |foo|
        hits << :foo

        foo.on '-q' do
          hits << :foo_q
        end
      end

      opt.subcommand 'bar' do |bar|
        hits << :bar

        bar.on '-s' do
          hits << :bar_s
        end
      end
    end
  end

  specify { run("-t").should == [:t] }
  specify { run("foo").should == [:foo] }
  specify { run("foo -q").should == [:foo, :foo_q] }
  specify { run("foo bar").should == [:foo] }
  specify { run("-t foo").should == [:t, :foo] }

  specify { lambda { run("foo -t") }.should raise_error(OptionParser::InvalidOption )}
end
