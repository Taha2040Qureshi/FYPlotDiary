class Town::PlotsController < Town::BaseController

  def index
    @title = 'Plots Details'
    @plots = current_town.plots.all
  end

  def new
    @plot = current_town.plots.new
  end

  def create
    @plot = current_town.plots.new(plot_params)
    @plot.town_id = current_user.town.id
    if @plot.valid?
      @plot.save
      flash[:success] = "Plot has been successfully added"
      return redirect_to town_plots_path
    else
      flash[:errors] = @plot.errors.full_messages
    end
    render :new
  end

  def edit
    @plot = current_user.town.plots.find(params[:id])
  end

  def update
    @plot = current_user.town.plots.find(params[:id])
    if @plot.update_attributes(plot_params)
      flash[:success] = "Plot datails has been updated!"
      return redirect_to town_plots_path
    else
      flash.now[:errors] = @plot.errors.full_messages
    end
    render :edit
  end

  def destroy
    plot = current_town.plots.where(:id => params[:id]).first
    plot.destroy
    flash[:success] = "Deleted"
    redirect_to :back
  end

  private

  def plot_params
    params.require(:plot).permit(:plot_number,:towns_id, :total_price, :area, :length, :width , :street, :description)
  end

end
