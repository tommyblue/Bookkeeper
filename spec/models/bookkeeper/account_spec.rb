require 'spec_helper'

module Bookkeeper
  describe Account do
    context "model attributes validations" do
      it "is valid with a numeric balance" do
        expect(build(:bookkeeper_balance)).to be_valid
      end

      # it "has a start date corresponding to the first movement creation date" do
      #   expect(build(:bookkeeper_balance)).to be_valid
      # end

      it "is invalid with a not-numeric balance" do
        expect(build(:bookkeeper_balance, balance: 'not_valid')).to have(1).errors_on(:balance)
      end
    end
  end
end


