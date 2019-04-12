module Tuner
  class Decorator < SimpleDelegator
    # Alias for accessing passed object
    #
    # @return [Object]
    def model
      __getobj__
    end

    alias_method :object, :model

    # Shortcut for creating a new instance of decorator
    #
    # @return [Object]
    def self.decorate(obj)
      new(obj)
    end

    # Decorate each element in the passed array
    #
    # @return [Array]
    def self.decorate_collection(collection)
      collection.map { |element| new(element) }
    end
  end
end
