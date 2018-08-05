class PublicHomeController < ApplicationController
  
  layout "public_home"

  def index
    @plots = Plot.last(5)
    @contactu = ContactU.new
  end
end
