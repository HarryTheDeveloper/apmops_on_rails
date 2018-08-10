module V1
  class PurchasesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_purchases, except: :create
    before_action :set_purchase, only: [:show, :update, :destroy]

    # GET /purchases
    def index
      render json: @purchases
    end

    # GET /purchases/1
    def show
      render json: @purchase
    end

    # POST /purchases
    def create
      @purchase = Purchase.new(purchase_params)

      if @purchase.save
        delete_corresponding_shop @purchase
        render json: @purchase, status: :created#, location: @purchase
      else
        render json: @purchase.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /purchases/1
    def update
      if @purchase.update(purchase_params)
        render json: @purchase
      else
        render json: @purchase.errors, status: :unprocessable_entity
      end
    end

    # DELETE /purchases/1
    def destroy
      @purchase.destroy
    end

    private
    def set_purchases
      # @purchases = Purchase.where(:user_id => current_user.id)
      @purchases = current_user.purchases
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_purchase
      @purchase = @purchases.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def purchase_params
      params.permit(:paper_id).merge(
          user_id: current_user.id
      )
    end

    def delete_corresponding_shop(purchase)
      shop = Shop.find_by_user_id_and_paper_id(purchase.user_id, purchase.paper_id)
      shop.destroy if shop
    end
  end
end