require 'positify'

class Seek
  module Pagination

    attr_writer :page, :per_page, :max_per_page, :default_per_page

    def page
      Positify.it @page
    end

    def per_page
      if @per_page.to_i > 0
        result = @per_page
      else
        result = default_per_page
      end
      Positify.it(result, max: max_per_page)
    end

    def max_per_page
      if @max_per_page.to_i > 0
        @max_per_page.to_i
      else
        self.class.config.default_max_per_page
      end
    end

    def default_per_page
      if @default_per_page.to_i > 0
        @default_per_page.to_i
      else
        self.class.config.default_per_page
      end
    end

  end
end
