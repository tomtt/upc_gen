RSpec.describe UpcGen::Shell do
  let(:err_double) { double('err') }
  let(:out_double) { double('out', puts: nil) }

  it "exits without replacing if no argument is passed" do
    argv = []
    expect(err_double).to receive(:puts).with ::UpcGen::Shell::BANNER
    expect(lambda { ::UpcGen::Shell.start( argv, out: out_double, err: err_double) }).to raise_error SystemExit
  end

  # This is an example of how you could hand over to a class
  it "does something if there is one argument" do
    argv = ['cookies']
    generate_upc_double = double(::UpcGen::GenerateUpc, show: nil)
    expect(::UpcGen::GenerateUpc).
      to receive(:new).
      with({color: 'cookies', show_version: false}, out: out_double, err: err_double).
      and_return(generate_upc_double)
    ::UpcGen::Shell.start( argv, out: out_double, err: err_double)
  end

  it "exits without replacing if more than one argument is passed" do
    argv = ['one', 'two']
    expect(err_double).to receive(:puts).with ::UpcGen::Shell::BANNER
    expect(lambda { ::UpcGen::Shell.start( argv, out: out_double, err: err_double) }).to raise_error SystemExit
  end

  it "sets show_version to true if -v option is passed" do
    argv = ['chocolate', '-v']
    expect(out_double).to receive(:puts).with("version: #{UpcGen::VERSION}")
    ::UpcGen::Shell.start( argv, out: out_double, err: err_double)
  end
end
