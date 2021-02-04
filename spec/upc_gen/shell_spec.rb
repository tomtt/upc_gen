RSpec.describe UpcGen::Shell do
  let(:err_double) { double("err") }
  let(:out_double) { double("out", puts: nil) }

  it "generates a code based on nil if there is none" do
    argv = []
    upc_generator_double = double(::UpcGen::UpcGenerator, generate: nil)
    expect(::UpcGen::UpcGenerator)
      .to receive(:new)
      .with(nil)
      .and_return(upc_generator_double)
    ::UpcGen::Shell.start(argv, out: out_double, err: err_double)
  end

  it "generates a code based on the first argument if there is one" do
    argv = ["0123."]
    upc_generator_double = double(::UpcGen::UpcGenerator, generate: nil)
    expect(::UpcGen::UpcGenerator)
      .to receive(:new)
      .with("0123.")
      .and_return(upc_generator_double)
    ::UpcGen::Shell.start(argv, out: out_double, err: err_double)
  end

  it "sets show_version to true if -v option is passed" do
    argv = ["123", "-v"]
    expect(out_double).to receive(:puts).with("version: #{UpcGen::VERSION}")
    ::UpcGen::Shell.start(argv, out: out_double, err: err_double)
  end
end
