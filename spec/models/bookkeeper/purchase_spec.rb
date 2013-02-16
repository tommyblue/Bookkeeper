require 'spec_helper'

module Bookkeeper
  describe Purchase do
    it "is valid with a title" do
      purchase = Purchase.new(title: 'test')
      expect(purchase).to be_valid
    end

    it "is invalid without a title" do
      purchase = Purchase.new(title: '')
      expect(purchase).to_not be_valid
    end

    it "has an optional description" do
      purchase = Purchase.new(title: 'test', description: 'test description')
      expect(purchase).to be_valid
    end

    it "has an optional purchase date" do
      purchase = Purchase.new(title: 'test', purchase_date: 2.years.ago)
      expect(purchase).to be_valid
    end

    it "has an optional warranty duration" do
      purchase = Purchase.new(title: 'test', warranty_duration: 24)
      expect(purchase).to be_valid
    end

    it "has a numeric warranty duration" do
      purchase = Purchase.new(title: 'test', warranty_duration: 24)
      expect(purchase).to be_valid
    end

    it "denies a not-numeric warranty duration" do
      purchase = Purchase.new(title: 'test', warranty_duration: 'not_valid')
      expect(purchase).to_not be_valid
    end

    it "has a valid date as purchase date" do
      purchase = Purchase.new(title: 'test', purchase_date: 24.months.ago)
      expect(purchase).to be_valid
    end

    it "denies an invalid date as purchase date" do
      purchase = Purchase.new(title: 'test', purchase_date: 'not_valid')
      expect(purchase).to_not be_valid
    end
  end
end
