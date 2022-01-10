require "ean13"

Encoding.default_external = "UTF-8"

module UpcGen
  class UpcGenerator
    def initialize(seed)
      @seed = seed
    end

    def n_random_digits(num)
      (1..num).map { rand(10) }.join
    end

    def find_code_ending_on(num)
      digits = num[0...-1]
      check = num[-1]
      n_random_digits(12 - num.length)
      candidate = EAN13.complete(n_random_digits(12 - digits.length) + digits)
      candidate = EAN13.complete(n_random_digits(12 - digits.length) + digits) while candidate[-1] != check
      candidate
    end

    def fill_number_string(number_string, random_position)
      return number_string if number_string.length >= 12

      case random_position
      when :start
        number_string + n_random_digits(12 - number_string.length)
      else
        n_random_digits(12 - number_string.length) + number_string
      end
    end

    def generate_for_seed
      number_string = @seed
      random_position = :end
      unless /^\d+$/.match?(number_string)
        random_position = :forced_end if /\d-/.match?(number_string)
        random_position = :start if /\d\./.match?(number_string)
        number_string = number_string.match(/^\d+/)[0]
      end

      return find_code_ending_on(number_string) if random_position == :forced_end

      fill_number_string(number_string, random_position)
    end

    def complete(upc)
      if [12, 13].include? upc.length
        EAN13.complete upc[0...12]
      else
        :invalid
      end
    end

    def generate
      if @seed && ![".", "-"].include?(@seed)
        complete generate_for_seed
      else
        complete n_random_digits(12)
      end
    end
  end
end
