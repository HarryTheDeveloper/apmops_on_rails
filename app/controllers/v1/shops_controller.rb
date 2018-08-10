module V1
  class ShopsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_shops, except: :create
    before_action :set_shop, only: [:show, :update, :destroy]

    # GET /shops
    def index
      render json: @shops
    end

    # GET /shops/1
    def show
      render json: @shop
    end

    # POST /shops
    def create
      @shop = Shop.new(shop_params)

      if @shop.save
        render json: @shop, status: :created, location: @shop
      else
        render json: @shop.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /shops/1
    def update
      if @shop.update(shop_params)
        render json: @shop
      else
        render json: @shop.errors, status: :unprocessable_entity
      end
    end

    # DELETE /shops/1
    def destroy
      @shop.destroy
    end

    private
    def set_shops
      # @purchases = Purchase.where(:user_id => current_user.id)
      @shops = current_user.shops
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = @shops.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shop_params
      params.permit(:paper_id).merge(
          user_id: current_user.id
      )
    end
  end
end