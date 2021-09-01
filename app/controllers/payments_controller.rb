class PaymentsController < ApplicationController
  def create
    @ahbab = Ahbab.find(params[:ahbab_id])
    @payment = @ahbab.payments.create(payment_params)
    redirect_to ahbab_path(@ahbab)
  end

  private
  def payment_params
    params.require(:payment).permit(:ahbab, :amount, :year)
  end
end
