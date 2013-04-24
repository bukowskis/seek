[![Build Status](https://travis-ci.org/bukowskis/seek.png)](https://travis-ci.org/bukowskis/seek)

# Seek

Sanitizes pagination and sorting options in a reusable and serializable way.

# Installation

```ruby
gem install seek
```

# Examples

```ruby
params = { page: '4', sort_order: 'desc', per_page: '1000' }

seek = Seek.new params,
       valid_sort_bys: %w{ first_name, last_name, age },
       max_per_page: 50,
       default_sort_by: :age,
       default_sort_order: :asc

seek.page       #=> 4
seek.per_page   #=> 50
seek.sort_by    #=> 'age'
seek.sort_order #=> 'desc
seek.order      #=> 'age desc'

seek.to_hash
  #=> Returns a Hash with all the parameters listed above.
```
