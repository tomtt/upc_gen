RSpec.describe UpcGen::UpcGenerator do
  it "has 12 random digits and check digit" do
    expect(::UpcGen::UpcGenerator.new(nil).generate).to match(/^\d{13}$/)
  end

  it "ends with digits in seed if it contains only numbers" do
    expect(::UpcGen::UpcGenerator.new("123").generate).to match(/^\d{9}123\d$/)
  end

  it "can deal with non-number characters gracefully" do
    expect(::UpcGen::UpcGenerator.new("123aa567").generate).to match(/^\d{9}123\d$/)
  end

  it "starts with digits in seed if there is a . after the numbers" do
    expect(::UpcGen::UpcGenerator.new("123.").generate).to match(/^123\d{10}$/)
  end

  it "has the digits at the very end if there is a - after the numbers" do
    expect(::UpcGen::UpcGenerator.new("123-").generate).to match(/^\d{10}123$/)
  end
end
