class Town::ContactUsController < ApplicationController
  

  def create 
    @contact_u = ContactU.new(contact_u_params)
    if @contact_u.save
      flash[:success] = "Message Submitted"
      redirect_to root_path
    else
      flash[:success] =  @contact_u.errors.message.first
      redirect_to :back
    end
  end
  
  def index
  end

  private

    def contact_u_params
      params.require(:contact_u).permit(:name, :email, :message)
    end
end
