require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class MovementsController < ApplicationController
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

