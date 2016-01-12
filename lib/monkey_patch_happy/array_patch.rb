class Array
  #跟flatten一样，递归出所有小粒度value,并执行对应的blocks
  #example: ["a","b",["c"]].each_recur {|elem| p elem}
  # def each_recur(&block)
  #   return flatten if block.blank?
  #   each do |elem|
  #     if elem.is_a? Array
  #       elem.each_recur &block
  #     else
  #       block.call elem
  #     end
  #   end
  # end
end