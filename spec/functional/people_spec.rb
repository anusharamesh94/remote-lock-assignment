require 'spec_helper'

RSpec.describe 'People Functional Test' do
  describe 'should return empty when params are empty' do
    let(:params) do
      {
        dollar_format: "",
        percent_format: nil,
        order: nil,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize

      expect(normalized_people).to eq []
    end
  end

  describe 'should return response as it is when order is nil' do
    let(:params) do
      {
        dollar_format: File.read('spec/fixtures/people_by_dollar.txt'),
        percent_format: File.read('spec/fixtures/people_by_percent.txt'),
        order: nil,
      }
    end
    let(:people_controller) { PeopleController.new(params) }

    it 'parses input files and outputs normalized data' do
      normalized_people = people_controller.normalize

      expect(normalized_people).to eq [
        "Rhiannon, Los Angeles, 4/30/1974",
        "Rigoberto, New York City, 1/5/1962",
        "Mckayla, Atlanta, 5/29/1986",
        "Elliot, New York City, 5/4/1947"
      ]
    end
  end
end