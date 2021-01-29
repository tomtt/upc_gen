# frozen_string_literal: true

Encoding.default_external = 'UTF-8'

require "upc_gen/version"

module UpcGen
  def self.root
    Pathname.new(File.absolute_path(File.join(File.dirname(__FILE__), '..')))
  end

  autoload :DoSomething , 'upc_gen/do_something'
  autoload :Shell , 'upc_gen/shell'
end
