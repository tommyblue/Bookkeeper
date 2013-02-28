require 'faker'

FactoryGirl.define do
  factory :bookkeeper_movement, :class => 'Bookkeeper::Movement' do
    amount Random.rand(-200..200)
    description { Faker::Lorem.sentence }

    factory :bookkeeper_positive_movement do
      amount Random.rand(1..200)
    end

    factory :bookkeeper_negative_movement do
      amount Random.rand(-200..-1)
    end

    factory :bookkeeper_invalid_movement do
      amount 0
    end
  end
end

