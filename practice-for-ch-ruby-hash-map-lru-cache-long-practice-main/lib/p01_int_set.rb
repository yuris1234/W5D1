class MaxIntSet # (set range of integers)

  attr_reader :store

  def initialize(max)
    @store = Array.new(50, false)
  end

  def insert(num)
    is_valid?(num)
    store[num] = true
  end

  def remove(num)
    is_valid?(num)
    store[num] = false
  end

  def include?(num)
    is_valid?(num)
    store[num] == true
  end

  private

  def is_valid?(num)
    raise "Out of bounds" if !(0..50).include?(num)
  end

  def validate!(num)
  end

end

class IntSet # (arbitrary range of integers)
  attr_reader :store
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end 

  def insert(num)
    self[num] << num 
  end

  def remove(num)
    i = self[num].find_index(num)
    store.delete_at(i)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet # (refactor IntSet to run faster)
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)

  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    if count >= num_buckets
      @store = Array.new(num_buckets+1) {Array.new}
      
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end