require 'byebug'

class LRUCache

    attr_reader :limit, :cache

    def initialize(limit=10)
      @cache = Array.new(limit)
      @limit = limit
    end

    def count
      # returns number of elements currently in cache
      cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      # if el already in there bring it to the front
      already_in_idx = @cache.index(el)
      @cache.delete_at(already_in_idx) if already_in_idx

      # if new item remove the least recently used if count > limit elements
      @cache.shift if self.count >= @limit
      @cache.push(el)
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @cache
    end

    private
    # helper methods go here!

end
