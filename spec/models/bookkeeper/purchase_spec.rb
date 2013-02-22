require 'spec_helper'

module Bookkeeper
  describe Purchase do
    context "model attributes validations" do
      it "is valid with a title" do
        expect(build(:bookkeeper_purchase)).to be_valid
      end

      it "is invalid without a title" do
        expect(build(:bookkeeper_purchase, title: nil)).to have(1).errors_on(:title)
      end

      it "has an optional description" do
        expect(build(:bookkeeper_purchase, description: nil)).to be_valid
      end

      it "has an optional purchase date" do
        expect(build(:bookkeeper_purchase, purchase_date: nil)).to be_valid
      end

      it "allows a blank purchase date" do
        expect(build(:bookkeeper_purchase, purchase_date: '')).to be_valid
      end

      it "has an optional warranty duration" do
        expect(build(:bookkeeper_purchase, warranty_duration: nil)).to be_valid
      end

      it "has an optional receipt" do
        expect(build(:bookkeeper_purchase, receipt: nil)).to be_valid
      end

      it "has a numeric warranty duration" do
        expect(build(:bookkeeper_purchase)).to be_valid
      end

      it "denies a not-numeric warranty duration" do
        expect(build(:bookkeeper_purchase, warranty_duration: 'not_valid')).to have(1).errors_on(:warranty_duration)
      end

      it "has a valid date as purchase date" do
        expect(build(:bookkeeper_purchase, purchase_date: 24.months.ago)).to be_valid
      end

      it "denies an invalid date as purchase date" do
        expect(build(:bookkeeper_purchase, purchase_date: 'not_valid')).to have(1).errors_on(:purchase_date)
      end
    end
  end
end
