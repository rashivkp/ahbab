class AhbabsController < ApplicationController
  def index
    if params[:show_all] == "true"
      @ahbabs = Ahbab.all
    else
      @ahbabs = Ahbab.all_active
    end
  end

  def show
    @ahbab = Ahbab.find(params[:id])
  end

  def new
    @ahbab = Ahbab.new
  end

  def create
    @ahbab = Ahbab.new(ahbab_params)

    if @ahbab.save
      redirect_to @ahbab
    else
      render :new
    end
  end

  def edit
    @ahbab = Ahbab.find(params[:id])
  end

  def update
    @ahbab = Ahbab.find(params[:id])

    if @ahbab.update(ahbab_params)
      redirect_to @ahbab
    else
      render :edit
    end
  end

  def destroy
    @ahbab = Ahbab.find(params[:id])
    @ahbab.destroy

    redirect_to root_path
  end

  def toggle_activation
    @ahbab = Ahbab.find(params[:ahbab_id])
    @ahbab.active = ! @ahbab.active
    @ahbab.save

    redirect_to root_path
  end

  private
    def ahbab_params
      params.require(:ahbab).permit(:name, :address, :amount, :active)
    end
end
