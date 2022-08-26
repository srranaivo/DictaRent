# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

URL = 'https://restcountries.com/v3.1/all'

require "json"
require "open-uri"

countries = URI.open(URL).read
countries_parse = JSON.parse(countries)

Land.all.destroy_all

countries_parse.each do |country|
  country_name = country['name']['common']
  country_area = country['area']
  country_population = country['population']
  country_flag = country['flags']['png']
  new_country = Land.new(name: country_name, area: country_area, population: country_population, flag: country_flag)
  new_country.save!
end
