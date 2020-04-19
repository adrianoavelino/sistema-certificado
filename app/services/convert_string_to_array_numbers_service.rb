class ConvertStringToArrayNumbersService
  def self.perform(string_numbers = "")
    string_numbers.gsub!(/ /,"")
    interval_numbers = self.get_interval_numbers(string_numbers)
    alternated_numbers = get_alternated_numbers(string_numbers)
    (alternated_numbers + interval_numbers).flatten
  end

  private
  def self.get_interval_numbers(string_numbers)
    interval_numbers = string_numbers.split(",").select{|i| i.match(/\d+\-\d+/)}
    array_numbers = interval_numbers.map{|v| n = v.split('-'); (n.first..n.last).to_a }
  end

  def self.get_alternated_numbers(string_numbers)
    numbers = string_numbers.split(",")
    numbers.select{|n| is_numeric?(n)}
  end

  def self.is_numeric?(string)
    !string.match?(/\D+/)
  end
end
