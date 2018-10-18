class Date

  FORMAT_LIST = [ 'year', 'month', 'day', 'hour', 'minute', 'second' ]
  FORMAT_CONVERSION = { 'year' => '%Y', 'month' => '%m', 'day' => '%d',
                        'hour' => '%H', 'minute' => '%M', 'second' => '%S' }

  def initialize(format)
    @format = format
  end

  def result
    @new_format = @format.split(':').reduce('') do |sum, elem|
      sum << "#{ FORMAT_CONVERSION[elem] }"
    end

    Time.now.strftime(@new_format)
  end

  def result_success?
    errors = @format.split(':').reject { |elem| FORMAT_LIST.include?(elem) }
    errors.empty?
  end

end
