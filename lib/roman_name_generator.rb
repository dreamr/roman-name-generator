require 'json'
require "version"

$:.unshift(File.dirname(__FILE__)+'/lib')

# The gems' namespace
module RomanNameGenerator
  # The Generator class handles the loading and randomizing the json
  # data store containing the roman name stub json. By default you only
  # need to call the initializer, and as soon as it is instantiated, 
  # it builds a random roman name based on the gender given.
  #
  # To get a new name, either initialize a new generator, or call
  # #regenerate
  #
  # Example:
  #   full_name = RomanNameGenerator::Generator.new("male").result
  class Generator

    attr_accessor :name_data, :gender, :result

    # Generates a random name and assigns it to #result
    # @param [String] gender the name's gender, `male` or `female`, defaults to `male`
    def initialize(gender="male")
      self.gender = gender
      generate
    end
    
    # Gives another random roman name based on the gender given in the
    # constructor, assigns it to #result, and then returns #result
    def regenerate
      generate
    end

  private
  
    def generate
      self.result = random_name.strip
    end

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