require 'faker'

FactoryGirl.define do
  factory :bookkeeper_account, :class => 'Bookkeeper::Account' do
    balance Random.rand(-200..200)
    title { Faker::Lorem.sentence }
  end
end


