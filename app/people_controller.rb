class PeopleController

  def initialize(params)
    @params = params
  end

  def normalize
    people = People.new(['last_name']) ## last name will be excluded !!

    if @params[:percent_format]
      people.date_formatter = '%Y-%m-%d' ## every file has its own date format
      people.records('%', @params[:percent_format])
    end
    if @params[:dollar_format]
      people.date_formatter = '%d-%m-%Y' ## every file has its own date format
      people.records('$', @params[:dollar_format])
    end
    people.sort_by_first_name
    people.join
  end

  private

  attr_reader :params
end
