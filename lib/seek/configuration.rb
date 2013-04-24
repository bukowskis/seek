class Seek
  class Configuration

    attr_writer :default_per_page, :default_max_per_page

    def default_per_page
      Positify.it {
        @default_per_page ||= 20
      }
    end

    def default_max_per_page
      Positify.it {
        @default_max_per_page ||= 100
      }
    end

  end
end

class Seek

  # Public: Returns the the configuration instance.
  #
  def self.config
    @config ||= Configuration.new
  end

  # Public: Yields the configuration instance.
  #
  def self.configure(&block)
    yield config
  end

  # Public: Reset the configuration (useful for testing)
  #
  def self.reset!
    @config = nil
  end
end
