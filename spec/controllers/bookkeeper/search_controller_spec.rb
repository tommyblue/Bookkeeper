require 'spec_helper'

module Bookkeeper
  describe SearchController do
    describe "POST create" do
      describe "with search results" do
        it "assigns the researched term as @q" do
          post :create, {search: {q: 'searchable'}, use_route: :purchases}
          expect(assigns(:q)).to eq('searchable')
        end
        it "Finds the purchase by title" do
          purchase = create(:bookkeeper_purchase, title: 'My searchable purchase')
          post :create, {search: {q: 'searchable'}, use_route: :purchases}
          expect(assigns(:results)).to eq([purchase])
        end
        it "Finds the purchase by description" do
          purchase = create(:bookkeeper_purchase, description: 'My searchable purchase')
          post :create, {search: {q: 'searchable'}, use_route: :purchases}
          expect(assigns(:results)).to eq([purchase])
        end
      end

      describe "without search results" do
        it "Doesn't find the purchase" do
          purchase = create(:bookkeeper_purchase, title: 'My searchable purchase')
          post :create, {search: {q: 'unsearchable'}, use_route: :purchases}
          expect(assigns(:results)).to eq([])
        end
      end
    end

  end
end
