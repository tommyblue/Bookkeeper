require 'spec_helper'

module Bookkeeper
  describe BalanceController do
    describe "GET index" do
      it "assigns all movements as @movements in reverse creation date" do
        movement1 = create(:bookkeeper_movement)
        movement2 = create(:bookkeeper_movement)
        movement3 = create(:bookkeeper_movement)
        movement4 = create(:bookkeeper_movement)
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

