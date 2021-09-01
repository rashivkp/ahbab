class PaymentsController < ApplicationController
  def create
    @ahbab = Ahbab.find(params[:ahbab_id])
    @payment = @ahbab.payments.create(payment_params)
    redirect_to ahbab_path(@ahbab)
  end

  def destroy
    @ahbab = Ahbab.find(params[:ahbab_id])
    @payment = @ahbab.payments.find(params[:id])
    @payment.destroy
    redirect_to ahbab_path(@ahbab)
  end

  private
  def payment_params
    params.require(:payment).permit(:ahbab, :amount, :year)
  end
end
