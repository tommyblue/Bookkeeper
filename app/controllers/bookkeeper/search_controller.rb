require_dependency "bookkeeper/application_controller"

module Bookkeeper
  class SearchController < ApplicationController
    def create
      @q = params[:search][:q]
      query = "%#{@q}%"
      @results = Purchase.where("title LIKE ? OR description LIKE ?", query, query)
    end
  end
end
