module ObjectFactory
  def self.format path, records = nil
    if path.include?('by_dollar') || path == '$'
      Dollar.new(path, records)
    elsif path.include?('by_percent') || path == '%'
      Percent.new(path, records)
    else
      nil
    end
  end
end