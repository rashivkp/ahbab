class AhbabsController < ApplicationController
  def index
    show_all = params[:show_all]
    if show_all == "true"
      @ahbabs = Ahbab.all
    else
      @ahbabs = Ahbab.all_active
    end

    if params[:q] and params[:q] != ""
      q = "%#{params[:q]}%"
      @ahbabs = Ahbab.where('mobile like :mobile OR name like :name',
                              {mobile: q, name: q}).merge(@ahbabs)
    end
    # @ahbabs = Ahbab.merge(@ahbabs).order(:name)
    @ahbabs = Ahbab.merge(@ahbabs).order(:name).page(params[:page])
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

  def mark_payment_received
    @ahbab = Ahbab.find(params[:ahbab_id])
    @payment = @ahbab.payments.create(
      year: Date.today.year,
      amount: @ahbab.amount,
    )
    redirect_to root_path
  end

  def list_due
    paid = Ahbab.joins(:payments).group('id').having('payments.year = ?', Date.today.year)
    @ahbabs = Ahbab.where("id NOT in (?)", paid.ids)
      .where(active: true)
      .order(:name).page(params[:page])
    render 'index'
  end

  private
    def ahbab_params
      params.require(:ahbab).permit(:name, :mobile, :address, :amount, :active)
    end
end
