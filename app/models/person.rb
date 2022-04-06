require 'date'

class Person
    attr_accessor :first_name, :last_name, :city, :birthdate

    CITIES = {
        NYC: "New York City",
        LA: "Los Angeles",
        AT: "Atlanta"
    }.freeze

    def initialize(params)
        params.each { |k, v| public_send("#{k}=", v)}
    end

    def city=(city)
        @city = CITIES[city.to_sym] || city
    end

    def birthdate=(birthdate)
        @birthdate = Date.parse(birthdate).strftime("%-m/%-d/%Y")
    end

    def personal_info
        "#{self.first_name}, #{self.city}, #{self.birthdate}" 
    end
end
