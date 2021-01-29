require 'ean13'

Encoding.default_external = 'UTF-8'

module UpcGen
  class UpcGenerator
    def initialize(seed)
      @seed = seed
    end

    def n_random_digits(n)
      (1..n).map { rand(10) }.join
    end

    def generate
      if @seed
        number_string = @seed
        random_position = :end
        unless number_string =~ /^\d*$/
          if number_string =~ /\d\./
            random_position = :start
          end
          number_string = number_string.match(/^\d+/)[0]
        end

        if number_string.length < 12
          if random_position == :start
            number_string += n_random_digits(12 - number_string.length)
          else
            number_string = n_random_digits(12 - number_string.length) + number_string
          end
        end
        EAN13.complete number_string
      else
        EAN13.complete n_random_digits(12)
      end
    end
  end
end
