class Seek
  module Tools

    def self.symbolize_keys(hash)
      result = hash.dup
      result.keys.each do |key|
        result[(key.to_sym rescue key) || key] = result.delete(key)
      end
      result
    end

  end
end
