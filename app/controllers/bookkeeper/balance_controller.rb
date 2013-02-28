require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class BalanceController < ApplicationController
    def index
      @movements = Movement.all

      respond_to do |format|
        format.html
        format.json { render json: @movements }
      end
    end
  end
end

