require 'optparse'

module UpcGen
  class Shell
    BANNER = <<"EOT"
usage: #{$0} color

Simple demo that prints color in the color if it knows about the color
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

      if options[:version]
        out.puts "version: #{UpcGen::VERSION}"
      end

      unless argv.size == 1
        self.usage(err: err)
      end

      options[:color] = argv[0]

      DoSomething.new(options, out: out, err: err).show
    end
  end
end
