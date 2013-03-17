require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class OutgoingsController < ApplicationController
    def new
      @outgoing = Outgoing.new
    end

    def edit
      @outgoing = Outgoing.find(params[:id])
    end

    def create
      @outgoing = Outgoing.new(params[:outgoing])

      if @outgoing.save
        redirect_to balance_index_path, notice: I18n.t('.bookkeeper.controllers.outgoings.created')
      else
        render action: "new"
      end
    end

    def update
      @outgoing = Outgoing.find(params[:id])

      if @outgoing.update_attributes(params[:outgoing])
        redirect_to balance_index_path, notice: I18n.t('.bookkeeper.controllers.outgoings.updated')
      else
        render action: "edit"
      end
    end
  end
end
