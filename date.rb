class Date

  def initialize(format)
    @format_list = [year, month, day, hour, minute, second]
    @format_conversion = { 'year' => '%Y', 'month' => '%m', 'day' => '%d',
                          'hour' => '%H', 'minute' => '%M', 'second' => '%S' }
    @format = format
    @new_format = ''
  end

  def result
    @query.split(':').each { |elem| @new_format += "#{  @format_conversion[elem] }" }
    Time.now.strftime(@new_format)
  end

  def result_success?
    errors = @query.split(':').reject { |elem| @format_list.include?(elem) }
    errors.empty?
  end

end
