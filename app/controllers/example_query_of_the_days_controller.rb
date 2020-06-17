class ExampleQueryOfTheDaysController < ApplicationController
  def index
    day = Date.today.strftime("%A")
    @query_of_the_day = "QueryOfTheDay::#{day}".constantize.new
  end
end
