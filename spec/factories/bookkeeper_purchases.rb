# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :bookkeeper_purchase, :class => 'Purchase' do
    title "MacBook Air"
    description "Purchased at MyStore"
    purchase_date "2013-02-15"
    warranty_duration 1
  end
end
