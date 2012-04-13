# optparse-subcommand

This gem extends Ruby's standard library `OptionParser` class to allow popular
subcommand-style tools (e.g. git).

## Usage

A new method `subcommand` is added to the `OptionParser` instance allowing you
to define an action to occur when that subcommand is detected as an argument.

The `subcommand` method takes a block which yields a new `OptionParser` instance.
Simply define your option parsing recursively for all subcommands.

Example:

``` Ruby
require 'optparse/subcommand' # Also requires 'optparse'
require 'ostruct'

options                = OpenStruct.new
options.verbose        = false
options.action         = nil
options.action_options = OpenStruct.new

parser = OptionParser.new do |opts|
  opts.on '-v', '--[no-]verbose' do |verbose|
    options.verbose = verbose
  end

  opts.subcommand 'foo' do do |foo|
    options.action = :foo

    foo.on '-x' do
      options.action_options.x = true
    end
  end
end
```

## License

See `LICENSE` file in this directory.
