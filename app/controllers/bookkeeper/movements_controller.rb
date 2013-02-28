require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class MovementsController < ApplicationController
    def index
      @movements = Movement.all

      respond_to do |format|
        format.html
        format.json { render json: @movements }
      end
    end

    def new
      @movement = Movement.new

      respond_to do |format|
        format.html
        format.json { render json: @movement }
      end
    end

    def edit
      @movement = Movement.find(params[:id])
    end

    def create
      @movement = Movement.new(params[:movement])

      respond_to do |format|
        if @movement.save
          format.html { redirect_to balance_index_path, notice: I18n.t('.bookkeeper.controllers.movements.created') }
          format.json { render json: @movement, status: :created, location: @movement }
        else
          format.html { render action: "new" }
          format.json { render json: @movement.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      @movement = Movement.find(params[:id])

      respond_to do |format|
        if @movement.update_attributes(params[:movement])
          format.html { redirect_to balance_index_path, notice: I18n.t('.bookkeeper.controllers.movements.updated') }
          format.json { head :no_content }
        else
          format.html { render action: "edit" }
          format.json { render json: @movement.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @movement = Movement.find(params[:id])
      @movement.destroy
      flash[:notice] = I18n.t('.bookkeeper.controllers.movements.destroyed')

      respond_to do |format|
        format.html { redirect_to balance_index_path }
        format.json { head :no_content }
      end
    end
  end
end

