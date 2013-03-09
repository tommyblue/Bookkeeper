require 'spec_helper'

module Bookkeeper
  describe BalanceController do
    describe "GET index" do
      before :each do
        @account = create(:bookkeeper_account)
      end

      it "assigns all movements as @movements in reverse creation date" do
        movement1 = create(:bookkeeper_movement, account: @account)
        movement2 = create(:bookkeeper_movement, account: @account)
        movement3 = create(:bookkeeper_movement, account: @account)
        movement4 = create(:bookkeeper_movement, account: @account)
        get :index, { use_route: :movements }
        expect(assigns(:movements)).to eq [movement4, movement3, movement2, movement1]
      end

      it "renders the :index template" do
        get :index, { use_route: :movements }
        expect(response).to render_template :index
      end
    end
  end
end

