require 'json'
require "version"

$:.unshift(File.dirname(__FILE__)+'/lib')

module RomanNameGenerator
  class Generator
    attr_accessor :name_data, :gender, :result, :type

    def initialize(gender)
      self.gender   = gender
      self.result   = random_name.strip
    end

  private

    def random_name
      load_name_data if self.name_data.nil?
      [random_first_name, random_middle_name, random_last_name].join(" ")
    end

    def random_first_name
      case self.gender
      when "male"
        data = self.name_data['praenomens']
        data[rand(data.length)]
      when "female"
        data = self.name_data['nomens']['female']
        data[rand(data.length)]
      end
    end

    def random_middle_name
      case self.gender
      when "male"
        data = self.name_data['nomens']['male']
        data[rand(data.length)]
      when "female"
        ""
      end
    end

    def random_last_name
      case self.gender
      when "male"
        data = self.name_data['cognomens']['male']
        data[rand(data.length)]
      when "female"
        data = self.name_data['cognomens']['female']
        data[rand(data.length)]
      end
    end

    def load_name_data
      self.name_data = JSON(
        File.open(
          File.expand_path("../data/names.json", __FILE__)
        ).read
      )
    end
  end
end