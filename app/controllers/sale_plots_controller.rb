class SalePlotsController < ApplicationController
  
  layout "public_home"

  def index
  	@plots = Plot.all
  end
end
