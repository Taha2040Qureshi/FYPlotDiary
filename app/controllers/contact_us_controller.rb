class ContactUsController < ApplicationController
  
  layout "public_home"

  def index
    @contactu = ContactU.new
  end
end
