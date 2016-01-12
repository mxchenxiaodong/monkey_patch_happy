require "spec_helper"

describe "nil.production?" do 
  it " is valid " do
    expect(nil.production?).to eq false
  end

  it " is invalid " do
    expect(nil.production?).not_to eq true
  end
end