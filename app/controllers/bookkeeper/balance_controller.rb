require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class BalanceController < ApplicationController
    def index
      @account = Account.first
      @movements = @account.movements
    end
  end
end

