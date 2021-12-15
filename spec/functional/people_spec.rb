require 'spec_helper'

RSpec.describe 'people main functionality' do
  describe 'should sort data based on different criteria' do
    let (:p){ People.new }
    before do
      p.date_formatter = '%d-%m-%Y'
      p.records("spec/fixtures/by_dollar.txt", nil)
    end

    it 'sort by first name' do
      p.sort_by_first_name
      expect(p.join).to eq   ["jackson, Adam, Cairo, 11/10/1924",
                              "jhon, Nolan, Los Angeles, 4/30/1974",
                              "mohamed, Sayed, Seattle, 1/9/1992",
                              "sandler, Bruen, New York City, 1/5/1962"]

    end

    it 'sort by last name' do
      p.sort_by_last_name
      expect(p.join).to eq  ["jackson, Adam, Cairo, 11/10/1924",
                             "sandler, Bruen, New York City, 1/5/1962",
                             "jhon, Nolan, Los Angeles, 4/30/1974",
                             "mohamed, Sayed, Seattle, 1/9/1992"]

    end

    it 'sort by city' do
      p.sort_by_city
      expect(p.join).to eq  ["jackson, Adam, Cairo, 11/10/1924",
                             "jhon, Nolan, Los Angeles, 4/30/1974",
                             "sandler, Bruen, New York City, 1/5/1962",
                             "mohamed, Sayed, Seattle, 1/9/1992"]

    end
  end
end
