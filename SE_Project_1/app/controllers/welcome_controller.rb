class WelcomeController < ApplicationController
  def index
    @message = params['a'].to_i + params['b'].to_i
  end
end
