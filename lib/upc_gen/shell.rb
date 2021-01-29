require 'optparse'

module UpcGen
  class Shell
    BANNER = <<"EOT"
usage: #{$0}

Prints a random UPC code
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

      puts GenerateUpc.new().generate
    end
  end
end
