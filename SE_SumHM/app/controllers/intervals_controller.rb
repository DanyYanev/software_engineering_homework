require 'csv'
require 'action_view'
include ActionView::Helpers::NumberHelper

class IntervalsController < ApplicationController

    def create
        puts 'Hello from Intervals create method.'
        csv_file = params[:file]
        #stores 'csv_file' into csv_file var
        max_sum = 0

        id = CSV.read(csv_file.path).size

        arr = Array.new(id)
        i = 0
        CSV.foreach(csv_file.path) do |row|
              arr[i] = row[0].to_f
              i+=1
        end

        i = 0

        until id - 30 < i do
          sum = 0
          j = i
          until j >= 30 + i do
            sum += arr[j] || 0
            j+=1
          end

          if sum > max_sum then
              max_sum = sum
          end

          i+=1
        end

        max_sum = max_sum.round(2)
        render plain: number_with_precision(max_sum, precision: 2)

        #puts "File: #{csv_file}"
        #prints the csv_file var
    end

end
