class Town::InvestmentsController < Town::BaseController

  def index
    @title = 'Investment Details'
    @investments = current_town.investments.all
  end

  def new
    @investment = current_town.investments.new
  end

  def create
    @investment = current_town.investments.new(investment_params)
    @investment.town_id = current_user.town.id
    if @investment.valid?
      @investment.save
      flash[:success] = "Investment has been successfully added"
      return redirect_to town_investments_path
    else
      flash[:errors] = current_town.investments.errors.full_messages
    end
    render :new
  end

  def edit
    debugger
    @stake_holder = current_town.stake_holders.where(:id => params[:id]).first
  end

  def update
    @stake_holder = current_town.stake_holders.find(params[:id])
    if @stake_holder.update_attributes(stake_holder_params)
      flash[:success] = "Stake Holder datails has been updated!"
      return redirect_to town_stake_holders_path
    else
      flash.now[:errors] = @stake_holder.errors.full_messages
    end
    render :edit
  end

  def destroy
    investment = current_town.investments.where(:id => params[:id]).first
    investment.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private
  def investment_params
    params.require(:investment).permit(:amount, :stake_holder_id)
  end

end
