require 'seek/configuration'
require 'seek/pagination'
require 'seek/sorting'
require 'seek/version'

class Seek
  include Pagination
  include Sorting

  attr_reader :options
  attr_accessor :coerce_null

  def initialize(params = {}, options = {})
    params = {} unless params
    self.page                   = params[:page]                    || params['page']
    self.per_page               = params[:per_page]                || params['per_page']
    self.sort_by                = params[:sort_by]                 || params['sort_by']
    self.sort_direction         = params[:sort_direction]          || params['sort_direction']
    self.coerce_null            = params[:coerce_null]             || params['coerce_null']
    self.max_per_page           = options[:max_per_page]           || options['max_per_page']
    self.valid_sort_bys         = options[:valid_sort_bys]         || options['valid_sort_bys']
    self.default_per_page       = options[:default_per_page]       || options['default_per_page']
    self.default_sort_by        = options[:default_sort_by]        || options['default_sort_by']
    self.default_sort_direction = options[:default_sort_direction] || options['default_sort_direction']
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
