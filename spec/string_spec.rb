require "spec_helper"

describe "String#production?" do
  it "when is production" do
    expect("production".production?).to eq true
  end

  it "when is not production" do
    expect("development".production?).to eq false
  end
end