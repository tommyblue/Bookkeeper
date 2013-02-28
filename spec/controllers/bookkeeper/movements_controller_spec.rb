require 'spec_helper'

module Bookkeeper
  describe MovementsController do
    describe "GET index" do
      it "assigns all movements as @movements" do
        movement = create(:bookkeeper_movement)
        get :index, { use_route: :movements }
        expect(assigns(:movements)).to match_array [movement]
      end

      it "renders the :index template" do
        movement = create(:bookkeeper_movement)
        get :index, { use_route: :movements }
        expect(response).to render_template :index
      end

      it "shows all movements ordered by creation" do
        first_movement = create(:bookkeeper_movement)
        last_movement = create(:bookkeeper_movement)
        get :index, { use_route: :movements }
        expect(assigns(:movements)).to eq([last_movement, first_movement])
      end

    end

    describe "GET new" do
      it "assigns a new movement as @movement" do
        get :new, { use_route: :movements }
        expect(assigns(:movement)).to be_a_new(Movement)
      end

      it "renders the :new template" do
        get :new, { use_route: :movements }
        expect(response).to render_template :new
      end
    end

    describe "GET edit" do
      it "assigns the requested movement as @movement" do
        movement = create(:bookkeeper_movement)
        get :edit, { id: movement.to_param, use_route: :movements }
        expect(assigns(:movement)).to eq(movement)
      end

      it "renders the :edit template" do
        movement = create(:bookkeeper_movement)
        get :edit, { id: movement.to_param, use_route: :movements }
        expect(response).to render_template :edit
      end
    end

    describe "POST create" do
      describe "with valid params" do
        it "creates a new movement" do
          expect {
            post :create, {movement: attributes_for(:bookkeeper_movement), use_route: :movements}
          }.to change(Movement, :count).by(1)
        end

        it "assigns a newly created movement as @movement" do
          post :create, {movement: attributes_for(:bookkeeper_movement), use_route: :movements}
          expect(assigns(:movement)).to be_a(Movement)
          expect(assigns(:movement)).to be_persisted
        end

        it "redirects to the balance page" do
          post :create, {movement: attributes_for(:bookkeeper_movement), use_route: :movements}
          expect(response).to redirect_to :balance_index
        end
      end

      describe "with invalid params" do
        it "does not save the new movement" do
          expect {
            post :create, {movement: attributes_for(:bookkeeper_invalid_movement), use_route: :movements}
          }.to_not change(Movement, :count).by(1)
        end

        it "assigns a newly created but unsaved movement as @movement" do
          post :create, {movement: attributes_for(:bookkeeper_invalid_movement), use_route: :movements}
          expect(assigns(:movement)).to be_a_new(Movement)
        end

        it "re-renders the 'new' template" do
          post :create, {movement: attributes_for(:bookkeeper_invalid_movement), use_route: :movements}
          expect(response).to render_template :new
        end
      end
    end

    describe "PUT update" do
      before :each do
        @movement_amount = 12.0
        @movement = create(:bookkeeper_movement, amount: @movement_amount, description: 'Test lorem ipsum')
      end

      describe "with valid params" do
        it "updates the requested movement" do
          put :update, {id: @movement, use_route: :movements, movement: attributes_for(:bookkeeper_movement)}
          expect(assigns(:movement)).to eq(@movement)
        end

        it "assigns the requested movement as @movement" do
          put :update, {id: @movement.to_param, movement: attributes_for(:bookkeeper_movement), use_route: :movements}
          expect(assigns(:movement)).to eq(@movement)
        end

        it "redirects to the balance page" do
          put :update, {id: @movement.to_param, movement: attributes_for(:bookkeeper_movement), use_route: :movements}
          expect(response).to redirect_to :balance_index
        end
      end

      describe "with invalid params" do
        it "assigns the movement as @movement" do
          put :update, {id: @movement.to_param, movement: attributes_for(:bookkeeper_invalid_movement), use_route: :movements}
          @movement.reload
          expect(@movement.amount).to eq(@movement_amount)
        end

        it "re-renders the 'edit' template" do
          put :update, {id: @movement.to_param, movement: attributes_for(:bookkeeper_invalid_movement), use_route: :movements}
          expect(response).to render_template :edit
        end
      end
    end

    describe "DELETE destroy" do
      before :each do
        @movement = create(:bookkeeper_movement)
      end
      it "destroys the requested movement" do
        expect {
          delete :destroy, {id: @movement.to_param, use_route: :movements}
        }.to change(Movement, :count).by(-1)
      end

      it "redirects to the balance page" do
        delete :destroy, {id: @movement.to_param, use_route: :movements}
        expect(response).to redirect_to :balance_index
      end
    end

  end
end

