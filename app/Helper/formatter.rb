class Formatter
  attr_accessor :content, :columns, :formatted_content
  MAP = ['first_name' , 'last_name' , 'city' , 'birthdate'] ## this is for ordering

  def initialize(path, content = nil)
    @content = content
    unless content
      @content = File.read(path)
    end
    @formatted_content = []
    @columns = []
  end

  def format
    raise 'Must be implemented by subclass'
  end

  def set_columns sign
    begin
      @columns = @content.each_line.first.split(sign).map { |str| str.gsub(/\s+/, "") }
    rescue StandardError, LoadError => e
      e
    end
  end

  def sort_hash hash
    MAP.select{|m| @columns.include? m}.map{|m| [m.to_sym, hash[m.to_sym]] }.to_h
  end

  def set_hash sign
    begin
      all_rows = []
      data = @content.each_line.drop(1).map { |str| str.split(sign) }
      data.each { |d| d.each { |str_| all_rows << str_.strip } }
      all_rows = all_rows.each_slice(@columns.size).to_a # convert it to 2d array each index will be a row
      all_rows.each do |arr|
        hash = {}
        arr.each_with_index do |d, i|
          hash[@columns[i].to_sym] = d
        end
        @formatted_content << (sort_hash hash)
      end
    rescue StandardError, LoadError => e
      e
    end
    @formatted_content
  end

end