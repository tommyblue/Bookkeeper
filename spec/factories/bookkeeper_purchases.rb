require 'faker'

FactoryGirl.define do
  factory :bookkeeper_purchase, :class => 'Bookkeeper::Purchase' do
    title { Faker::Name.title }
    description { Faker::Lorem.sentence }
    purchase_date "2013-02-15"
    warranty_duration 24
    receipt File.open(Rails.root.join('..', 'assets', 'images', 'receipt.jpg'))
    amount 100

    factory :bookkeeper_invalid_purchase do
      title nil
    end
  end
end
