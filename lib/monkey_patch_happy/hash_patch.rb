class ::Hash
  #example:
  #{:a => 1, "b" => 2, "c" => 3}.fetch_all(:a, :b)
  #{:a => 1, "b" => 2, "c" => 3}.fetch_all([:a, :b]) or [[:a, :b]]
  def fetch_all(*args)
    #values_at不支持数组
    # args.flatten.map{|key| fetch(key)} #如果没找到该键值，会报错。
    #compact 去掉为nil的键
    args.flatten.map{|key| self[key]}
  end


  #str = "h", hash = {"01" => 1, "02" => 2 }
  #result: {:h1 => 1, :h2 => 2 }
  def format_key_to_sym(str)
    new_hash = {}
    self.each do |key, value|
      new_hash[(str + key.to_i.to_s).to_sym] = value if key.present?
    end
    # self = nil #release
    new_hash
  end

  #not test
  def format_hour_key
    new_hash = {}
    self.each do |key, value|
      new_hash[( "h" + (key.to_i + 1).to_s).to_sym] = value
    end
    new_hash
  end
end