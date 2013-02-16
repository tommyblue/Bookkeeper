require 'faker'

FactoryGirl.define do
  factory :bookkeeper_purchase, :class => 'Bookkeeper::Purchase' do
    title { Faker::Name.title }
    description { Faker::Lorem.sentence }
    purchase_date "2013-02-15"
    warranty_duration 24
  end
end
