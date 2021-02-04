require "optparse"

module UpcGen
  class Shell
    BANNER = <<~"MSG"
      usage: #{$0} <optional-number-string><optional-char>

      Prints a random UPC code

      If a number string is passed, the code before the check digit will end with those digits
      If the string of numbers is followed by a '.', the random code will start with those digits
      If the string of numbers is followed by a '-', a code will be found that ends with those digits, including check digit
    MSG

    def self.usage(err: $stderr)
      err.puts BANNER
      exit 1
    end

    def self.gather_options(argv)
      options = {
        show_version: false
      }

      OptionParser.new { |parser|
        parser.banner = BANNER

        parser.on("-v", "--version", "Show version") do |version|
          options[:version] = version
        end
      }.parse! argv
      options
    end

    def self.start(argv, out: $stdout, err: $stderr)
      options = gather_options(argv)

      out.puts "version: #{UpcGen::VERSION}" if options.delete(:version)

      out.puts UpcGenerator.new(argv[0]).generate
    end
  end
end
