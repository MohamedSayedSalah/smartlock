require 'spec_helper'

RSpec.describe 'Input formatter' do
  describe 'check  integrity of created data' do

    it 'should format date and sort rows based on [firstname, lastname, city, birthdate ]' do
      p = People.new
      p.date_formatter = '%d-%m-%Y'
      p.records("spec/fixtures/by_dollar.txt", nil)
      expect(p.people).to eq [{ :first_name => "jhon",
                                :last_name => "Nolan",
                                :city => "Los Angeles",
                                :birthdate => "4/30/1974",
                              },
                              { :first_name => "sandler",
                                :last_name => "Bruen",
                                :birthdate => "1/5/1962",
                                :city => "New York City"
                              },
                              { :first_name => "mohamed",
                                :last_name => "Sayed",
                                :birthdate => "1/9/1992",
                                :city => "Seattle",
                              },
                              { :first_name => "jackson",
                                :last_name => "Adam",
                                :birthdate => "11/10/1924",
                                :city => "Cairo",
                              }]
    end
  end
end
