require 'csv'
require 'action_view'
include ActionView::Helpers::NumberHelper

class Sums1Controller < ApplicationController
  def index
  end

  def create
    puts 'Hello from sums1 create method.'
    csv_file = params[:file]
    #stores 'csv_file' into csv_file var
    sum = 0
    CSV.foreach(csv_file.path) do |row|
    #csv foreach requires path, not object.
      sum += row[0].to_f
      #puts sum
    end

    sum = sum.round(2)
    #.ceil(2) equivalent ceil wont run on heroku
    render plain: number_with_precision(sum, precision: 2)

    #puts "File: #{csv_file}"
    #prints the csv_file var
  end
end
