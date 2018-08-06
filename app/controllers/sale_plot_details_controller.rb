class SalePlotDetailsController < ApplicationController
  
  layout "public_home"

  def index
    @plot = Plot.find(params[:id])
    @contactu = ContactU.new
  end
end
