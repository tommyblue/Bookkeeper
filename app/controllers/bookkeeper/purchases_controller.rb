require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class PurchasesController < ApplicationController
    def index
      @purchases = Purchase.all

      respond_to do |format|
        format.html
        format.json { render json: @purchases }
      end
    end

    def show
      @purchase = Purchase.find(params[:id])

      respond_to do |format|
        format.html
        format.json { render json: @purchase }
      end
    end

    def new
      @purchase = Purchase.new

      respond_to do |format|
        format.html
        format.json { render json: @purchase }
      end
    end

    def edit
      @purchase = Purchase.find(params[:id])
    end

    def create
      @purchase = Purchase.new(params[:purchase])

      respond_to do |format|
        if @purchase.save
          format.html { redirect_to purchases_path, notice: 'Purchase was successfully created.' }
          format.json { render json: @purchase, status: :created, location: @purchase }
        else
          format.html { render action: "new" }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @purchase = Purchase.find(params[:id])

      respond_to do |format|
        if @purchase.update_attributes(params[:purchase])
          format.html { redirect_to purchases_path, notice: 'Purchase was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @purchase.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @purchase = Purchase.find(params[:id])
      @purchase.destroy

      respond_to do |format|
        format.html { redirect_to purchases_url }
        format.json { head :no_content }
      end
    end
  end
end
