require 'time'
class People
  attr_accessor :people, :exclude, :date_formatter

  def initialize(args)
    @exclude = args
    @people = []
  end

  def records path, records
    records = ObjectFactory::format(path, records).format
    records.each do |r|
      r[:birthdate] = date_formatter! r[:birthdate]
      @people << r
    end
  end

  def method_missing(name, *args)
    case name
      when /^sort_by_([a-z_]+)/
        @people.sort_by! { |a| a[:first_name] }
      else
        nil
      end
  end

  def join
    @exclude.each { |e| @people.each{|p| p.delete(e.to_sym)} }
    @people.map { |p| p.values.join(', ') }
  end

  private

  def date_formatter! date, to = '%-m/%-d/%Y'
    Date.strptime(date, @date_formatter).strftime(to)
  rescue
    "Could not format date"
  end

end