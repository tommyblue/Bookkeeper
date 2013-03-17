require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class IncomingsController < ApplicationController
    def new
      @incoming = Incoming.new
    end

    def edit
      @incoming = Incoming.find(params[:id])
    end

    def create
      @incoming = Incoming.new(params[:incoming])

      if @incoming.save
        redirect_to balance_index_path, notice: I18n.t('.bookkeeper.controllers.incomings.created')
      else
        render action: "new"
      end
    end

    def update
      @incoming = Incoming.find(params[:id])

      if @incoming.update_attributes(params[:incoming])
        redirect_to balance_index_path, notice: I18n.t('.bookkeeper.controllers.incomings.updated')
      else
        render action: "edit"
      end
    end

    def destroy
      @incoming = Incoming.find(params[:id])
      @incoming.destroy
      flash[:notice] = I18n.t('.bookkeeper.controllers.incomings.destroyed')

      redirect_to balance_index_path
    end
  end
end
