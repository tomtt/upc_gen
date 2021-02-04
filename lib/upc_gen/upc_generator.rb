require "ean13"

Encoding.default_external = "UTF-8"

module UpcGen
  class UpcGenerator
    def initialize(seed)
      @seed = seed
    end

    def n_random_digits(n)
      (1..n).map { rand(10) }.join
    end

    def find_code_ending_on(n)
      digits = n[0...-1]
      check = n[-1]
      n_random_digits(12 - n.length)
      candidate = EAN13.complete(n_random_digits(12 - digits.length) + digits)
      while candidate[-1] != check
        candidate = EAN13.complete(n_random_digits(12 - digits.length) + digits)
      end
      candidate
    end

    def generate
      if @seed
        number_string = @seed
        random_position = :end
        unless /^\d*$/.match?(number_string)
          if /\d-/.match?(number_string)
            random_position = :forced_end
          end
          if /\d\./.match?(number_string)
            random_position = :start
          end
          number_string = number_string.match(/^\d+/)[0]
        end

        if number_string.length < 12
          if random_position == :start
            number_string += n_random_digits(12 - number_string.length)
          elsif random_position == :forced_end
            return find_code_ending_on(number_string)
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
