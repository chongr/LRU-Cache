class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash_to_return = 0
    return nil.hash if self.empty?
    self.each_with_index do |ele, ind|
      hash_to_return += (ele.hash ^ ind.hash).abs
    end
    hash_to_return
  end
end

class String
  def hash
    hash_to_return = 0
    return 'a'.ord.hash ^ nil.hash if self.empty?
    self.chars.each_with_index do |char, ind|
      hash_to_return += (char.ord.hash ^ ind.hash).abs
    end


    hash_to_return ^ 124124.hash
  end
end

class Hash
  def hash
    hash_to_return = 0
    keys_array = self.keys.sort
    return 'h'.ord.hash ^ nil.hash if self.empty?
    keys_array.each do |key|
      hash_to_return += (key.hash ^ self[key].hash)
    end
    hash_to_return
  end
end
