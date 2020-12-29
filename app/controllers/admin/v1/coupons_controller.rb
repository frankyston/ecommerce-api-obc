# frozen_string_literal: true

module Admin::V1
  class CouponsController < ApiController
    before_action :set_coupon, only: [:update, :destroy]

    def index
      @coupons = Coupon.all
    end

    def create
      @coupon = Coupon.new
      @coupon.attributes = coupon_params
      save_coupon!
    end

    def update
      @coupon.attributes = coupon_params
      save_coupon!
    end

    def destroy
      @coupon.destroy!
    end

    private

    def set_coupon
      @coupon = Coupon.find(params[:id])
    end

    def coupon_params
      return {} unless params.has_key?(:coupon)

      params.require(:coupon).permit(:id, :name, :code, :status, :discount_value, :max_use, :due_date)
    end

    def save_coupon!
      @coupon.save!
      render :show
    rescue
      render_error(fields: @coupon.errors.messages)
    end
  end
end