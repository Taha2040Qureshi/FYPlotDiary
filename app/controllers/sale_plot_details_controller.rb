class SalePlotDetailsController < ApplicationController
  
  layout "public_home"

  def index
    @plot = Plot.find(params[:id])
  end
end
