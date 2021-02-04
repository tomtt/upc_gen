RSpec.describe UpcGen do
  it "has a version number" do
    expect(UpcGen::VERSION).not_to be nil
  end

  it "knows its root" do
    expect(UpcGen.root).to eq Pathname.new(Dir.pwd)
  end

  it "contains the files of itself in its root directory" do
    expect(File).to be_exist File.join(UpcGen.root, "lib", "upc_gen", "version.rb")
  end
end
