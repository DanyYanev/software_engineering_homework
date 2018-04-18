require 'csv'
require 'action_view'
include ActionView::Helpers::NumberHelper

class FiltersController < ApplicationController

    def create
        puts 'Hello from filters create method.'
        csv_file = params[:file]
        #stores 'csv_file' into csv_file var
        sum = 0
        CSV.foreach(csv_file.path) do |row|
          if row[2].to_f % 2 != 0 then
            sum += row[1].to_f
          end
        end
        sum = sum.round(2)
        #.ceil(2) equivalent ceil wont run on heroku

        render plain: number_with_precision(sum, precision: 2)
    end
end
