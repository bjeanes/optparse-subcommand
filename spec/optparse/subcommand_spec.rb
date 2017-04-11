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

  specify { expect(run("-t")).to eq([:t]) }
  specify { expect(run("foo")).to eq([:foo]) }
  specify { expect(run("foo -q")).to eq([:foo, :foo_q]) }
  specify { expect(run("foo bar")).to eq([:foo]) }
  specify { expect(run("-t foo")).to eq([:t, :foo]) }

  specify { expect { run("foo -t") }.to raise_error(OptionParser::InvalidOption )}

  specify { expect(options.to_s).to match(/foo/) }
end
