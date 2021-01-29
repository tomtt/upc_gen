require 'optparse'

module UpcGen
  class Shell
    BANNER = <<"EOT"
usage: #{$0} <optional-number-string><optional-dot>

Prints a random UPC code

If a number string is passed, the code before the check digit will end with those digits
If the string of numbers is followed by a '.', the random code will start with those digits
EOT

    def self.usage(err: STDERR)
      err.puts BANNER
      exit 1
    end

    def self.start(argv, out: STDOUT, err: STDERR)
      options = {
        show_version: false
      }

      OptionParser.new do |parser|
        parser.banner = BANNER

        parser.on("-v", "--version", "Show version") do |version|
          options[:version] = version
        end
      end.parse! argv

      if options.delete(:version)
        out.puts "version: #{UpcGen::VERSION}"
      end

      out.puts UpcGenerator.new(argv[0]).generate
    end
  end
end
