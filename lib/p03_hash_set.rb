require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1

    resize! if count >= num_buckets
    @store[key.hash % num_buckets] << key

  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    @store[key.hash % num_buckets].delete(key)
  end

  private

  def [](num)
    @store[num.hash % num_buckets]# optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(num_buckets*2) { Array.new }

    @store.each do |bucket|
      bucket.each do |element|
        new_array[element.hash % (num_buckets*2)] << element
      end
    end

    @store = new_array

  end
end
