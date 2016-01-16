require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  attr_reader :count

  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.include?(key)
      link = @map.get(key)
      update_link!(link)
      return link.val
    else
      eject! if count == @max
      return_val = calc!(key)
      @store.insert(key, return_val)
      @map[key] = @store.first
    end

    return_val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    @prc.call(key)
  end

  def update_link!(link)
    @store.remove(link)
    @store.insert(link.key, link.val)
  end

  def eject!
    link = @store.last
    @store.remove(link)
    @map.delete(link.key)
  end
end
