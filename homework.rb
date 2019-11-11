class LRUCache
    def initialize(n)
        @size = n
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if count >= @size
        @cache.shift 
        @cache << el
      elsif @cache.include?(el)
      else
        @cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      puts "#{@cache}"
    end

    private
    # helper methods go here!
    attr_accessor :cache

  end