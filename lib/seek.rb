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
    self.sort_order   = params[:sort_order]
    self.max_per_page       = options[:max_per_page]
    self.valid_sort_bys     = options[:valid_sort_bys]
    self.default_sort_by    = options[:default_sort_by]
    self.default_sort_order = options[:default_sort_order]
  end

  def to_hash
    {
      page: page,
      per_page: per_page,
      sort_by: sort_by,
      sort_order: sort_order,
      order: order,
    }
  end

end
