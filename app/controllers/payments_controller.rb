class PaymentsController < ApplicationController
  before_action :authenticate_user!
  def show

  end

  def create
    if check_series_numbers params
      current_user = current_user.total_coin.to_i + 100
      current_user.save!
      flash[:success] = "buy coin success."
      redirect_to root_path
    else
      flash[:danger] = "buy coin failed"
      redirect_to root_path
    end
  end

private

  def check_series_numbers params
    if params[:serial_number].present?
        M::SerialNumber.find_by(serial_number: params[:serial_number]).present?
    end
  end
end
