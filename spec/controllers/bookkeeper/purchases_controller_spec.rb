require 'spec_helper'

module Bookkeeper
  describe PurchasesController do
    def valid_session
      {}
    end

    describe "GET index" do
      it "assigns all purchases as @purchases" do
        purchase = create(:bookkeeper_purchase)
        get :index, { use_route: :purchases }, valid_session
        expect(assigns(:purchases)).to match_array [purchase]
      end

      it "renders the :index template" do
        purchase = create(:bookkeeper_purchase)
        get :index, { use_route: :purchases }, valid_session
        expect(response).to render_template :index
      end
    end

    # describe "GET show" do
    #   it "assigns the requested purchase as @purchase" do
    #     purchase = create(:bookkeeper_purchase)
    #     get :show, { id: purchase.to_param, use_route: :purchases }, valid_session
    #     expect(assigns(:purchase)).to eq purchase
    #   end

    #   it "renders the :show template" do
    #     purchase = create(:bookkeeper_purchase)
    #     get :show, { id: purchase.to_param, use_route: :purchases }, valid_session
    #     expect(response).to render_template :show
    #   end
    # end

    describe "GET new" do
      it "assigns a new purchase as @purchase" do
        get :new, { use_route: :purchases }, valid_session
        expect(assigns(:purchase)).to be_a_new(Purchase)
      end

      it "renders the :new template" do
        get :new, { use_route: :purchases }, valid_session
        expect(response).to render_template :new
      end
    end

    describe "GET edit" do
      it "assigns the requested purchase as @purchase" do
        purchase = create(:bookkeeper_purchase)
        get :edit, { id: purchase.to_param, use_route: :purchases }, valid_session
        expect(assigns(:purchase)).to eq(purchase)
      end

      it "renders the :edit template" do
        purchase = create(:bookkeeper_purchase)
        get :edit, { id: purchase.to_param, use_route: :purchases }, valid_session
        expect(response).to render_template :edit
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new Purchase" do
          expect {
            post :create, {purchase: attributes_for(:bookkeeper_purchase), use_route: :purchases}, valid_session
          }.to change(Purchase, :count).by(1)
        end

        it "assigns a newly created purchase as @purchase" do
          post :create, {purchase: attributes_for(:bookkeeper_purchase), use_route: :purchases}, valid_session
          expect(assigns(:purchase)).to be_a(Purchase)
          expect(assigns(:purchase)).to be_persisted
        end

        it "redirects to the purchases page" do
          post :create, {purchase: attributes_for(:bookkeeper_purchase), use_route: :purchases}, valid_session
          expect(response).to redirect_to :purchases
        end
      end

      describe "with invalid params" do
        it "does not save the new Purchase" do
          expect {
            post :create, {purchase: attributes_for(:bookkeeper_invalid_purchase), use_route: :purchases}, valid_session
          }.to_not change(Purchase, :count).by(1)
        end

        it "assigns a newly created but unsaved purchase as @purchase" do
          post :create, {purchase: attributes_for(:bookkeeper_invalid_purchase), use_route: :purchases}, valid_session
          expect(assigns(:purchase)).to be_a_new(Purchase)
        end

        it "re-renders the 'new' template" do
          post :create, {purchase: attributes_for(:bookkeeper_invalid_purchase), use_route: :purchases}, valid_session
          expect(response).to render_template :new
        end
      end
    end

    describe "PUT update" do
      before :each do
        @purchase_title = 'Test title'
        @purchase = create(:bookkeeper_purchase, title: @purchase_title, description: 'Test lorem ipsum')
      end

      describe "with valid params" do
        it "updates the requested purchase" do
          put :update, {id: @purchase, use_route: :purchases, purchase: attributes_for(:bookkeeper_purchase)}, valid_session
          expect(assigns(:purchase)).to eq(@purchase)
        end

        it "assigns the requested purchase as @purchase" do
          put :update, {id: @purchase.to_param, purchase: attributes_for(:bookkeeper_purchase), use_route: :purchases}, valid_session
          expect(assigns(:purchase)).to eq(@purchase)
        end

        it "redirects to the purchase" do
          put :update, {id: @purchase.to_param, purchase: attributes_for(:bookkeeper_purchase), use_route: :purchases}, valid_session
          expect(response).to redirect_to(:purchases)
        end
      end

      describe "with invalid params" do
        it "assigns the purchase as @purchase" do
          put :update, {id: @purchase.to_param, purchase: attributes_for(:bookkeeper_invalid_purchase), use_route: :purchases}, valid_session
          @purchase.reload
          expect(@purchase.title).to eq(@purchase_title)
        end

        it "re-renders the 'edit' template" do
          put :update, {id: @purchase.to_param, purchase: attributes_for(:bookkeeper_invalid_purchase), use_route: :purchases}, valid_session
          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE destroy" do
      before :each do
        @purchase = create(:bookkeeper_purchase)
      end
      it "destroys the requested purchase" do
        expect {
          delete :destroy, {id: @purchase.to_param, use_route: :purchases}, valid_session
        }.to change(Purchase, :count).by(-1)
      end

      it "redirects to the purchases list" do
        delete :destroy, {id: @purchase.to_param, use_route: :purchases}, valid_session
        expect(response).to redirect_to :purchases
      end
    end

  end
end
