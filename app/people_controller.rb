require_relative 'services/people_parser'

class PeopleController
  def initialize(params)
    @order = params[:order]
    @params = params.except(:order)
  end

  def normalize
    people_list = []
    # send each param to parser service
    @params.each do |key, value|
      unless value.nil? || value.empty?
       people_list <<  PeopleParser.new(key, value).call
      end
    end

    people_list.flatten!

    # sort people by the order param
    sorted_list = @order ? people_list.sort_by { |people| people.send(@order) } : people_list

    result_array(sorted_list)
  end

  private

  def result_array(sorted_list)
    sorted_list.map(&:personal_info)
  end

  attr_reader :params
end
