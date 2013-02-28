require 'spec_helper'

module Bookkeeper
  describe Movement do
    context "model attributes validations" do
      it "is valid with a amount not 0 and a description" do
        expect(build(:bookkeeper_movement)).to be_valid
      end

      it "is invalid with an amount of 0" do
        expect(build(:bookkeeper_movement, amount: 0)).to have(1).errors_on(:amount)
      end

      it "is invalid with a blank description" do
        expect(build(:bookkeeper_movement, description: '     ')).to have(1).errors_on(:description)
      end

      it "is invalid without a description" do
        expect(build(:bookkeeper_movement, description: nil)).to have(1).errors_on(:description)
      end

      it "is invalid with a not-numeric amount" do
        expect(build(:bookkeeper_movement, amount: 'not_valid')).to have(2).errors_on(:amount)
      end
    end
  end
end

