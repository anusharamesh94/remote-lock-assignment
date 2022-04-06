require_relative '../models/person'

class PeopleParser
    FORMATS = {
        dollar_format: '$',
        percent_format: '%'
    }

    def initialize(format, params)
        @separator = FORMATS[format]
        @rows = params.split("\n")
        @keys = @rows.shift.split(@separator).map(&:strip)
    end

    def call
        people = []
        @rows.each do |row|
            attr_values = row.split(@separator).map(&:strip)
            person_attributes = Hash[@keys.zip(attr_values)]
            people << Person.new(person_attributes)
        end
        people
    end
end
