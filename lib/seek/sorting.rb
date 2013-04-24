class Seek
  module Sorting

    attr_writer :sort_by, :sort_direction, :valid_sort_bys, :default_sort_by, :default_sort_direction

    # Returns true if sort_by and sort_direction are present.
    #
    def sortable?
      !!order
    end

    # Returns a String or nil.
    #
    def sort_by
      result = @sort_by.to_s.downcase
      return result if !result.empty? && (valid_sort_bys.empty? || valid_sort_bys.include?(result))
      default_sort_by
    end

    def sort_direction
      result = @sort_direction.to_s.downcase
      valid_sort_directions.include?(result) ? result : valid_sort_directions.first
    end

    # Useful for queries that require the format "first_name desc" (such as SQL or lucene)
    #
    # Returns a String or nil
    #
    def order
      return if sort_by.to_s.empty?
      [sort_by, sort_direction].join(' ')
    end

    def valid_sort_bys
      Array(@valid_sort_bys).map(&:to_s).map(&:downcase)
    end

    # Returns a String or nil.
    #
    def default_sort_by
      result = @default_sort_by.to_s.downcase
      valid_sort_bys.include?(result) ? result : valid_sort_bys.first
    end

    def default_sort_direction
      result = @default_sort_direction.to_s.downcase
      valid_sort_directions.include?(result) ? result : valid_sort_directions.first
    end

    private

    def valid_sort_directions
      %w{ asc desc }
    end

  end
end
