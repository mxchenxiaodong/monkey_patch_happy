require "spec_helper"

describe "Hash#fetch_all" do 
  it "fetch some key with array" do
    my_hash = {"01" => 45, "02" => 78, "10" => 105, "11" => 199, "12" => 500}

    expect(my_hash.fetch_all(["01", "05", "10"])).to eq [45, nil, 105]
    expect(my_hash.fetch_all(["01", "12", "10"])).not_to eq [45, 44, 105]
  end

  it "fetch some key" do
    my_hash = {"01" => 45, "02" => 78, "10" => 105, "11" => 199, "12" => 500}
    expect(my_hash.fetch_all("01", "05", "10")).to eq [45, nil, 105]
  end
end

describe "Hash#format_key_to_sym" do
  it "format key to sym and filter blank" do
    my_hash = {"01" => 45, "02" => 78, "10" => 105, "11" => 199, "12" => 500}
    expect(my_hash.format_key_to_sym("h")).to eq ({:h1 => 45, :h2 => 78, :h10 => 105, :h11 => 199, :h12 => 500 })
    
    my_hash = {"01" => 45, "" => 78, nil => 105, "  " => 199, "12" => 500}
    expect(my_hash.format_key_to_sym("h")).to eq ({:h1 => 45, :h12 => 500 })
  end
end