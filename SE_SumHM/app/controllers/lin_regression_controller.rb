require 'csv'
require 'linear-regression/linear'
#require 'action_view'
#include ActionView::Helpers::NumberHelper

class LinRegressionController < ApplicationController
  def create
    csv_file = params[:file]

    #size = 0
    size = CSV.read(csv_file.path).size

    x = []
    y = []

    CSV.foreach(csv_file.path).with_index(1) do |row, index|
      x.push index
      y.push row.first.to_f
    end

    lin_reg = Regression::Linear.new x, y
    render plain: '%.6f,%.6f' % [lin_reg.slope, lin_reg.intercept]
  end
end
