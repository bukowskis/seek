require 'seek/configuration'
require 'seek/pagination'
require 'seek/sorting'
require 'seek/tools'
require 'seek/version'

class Seek
  include Pagination
  include Sorting

  attr_reader :options

  def initialize(params = {}, options = {})
    params  = params ? Tools.symbolize_keys(params) : {}
    options = options ? Tools.symbolize_keys(options) : {}
    self.page         = params[:page]
    self.per_page     = params[:per_page]
    self.sort_by      = params[:sort_by]
    self.sort_direction   = params[:sort_direction]
    self.max_per_page       = options[:max_per_page]
    self.valid_sort_bys     = options[:valid_sort_bys]
    self.default_per_page   = options[:default_per_page]
    self.default_sort_by    = options[:default_sort_by]
    self.default_sort_direction = options[:default_sort_direction]
  end

  def to_hash
    {
      page: page,
      per_page: per_page,
      sort_by: sort_by,
      sort_direction: sort_direction,
      order: order,
    }
  end

end
