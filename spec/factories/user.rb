FactoryBot.define do
  factory :user do
    factory :user_one do
      email { 'one@one.com' }
    end

    factory :user_two do
      email { 'two@two.com' }
    end

    factory :user_with_purchases do
      after :create do |user|
        create_list :purchase_one, 3, user: user
        create_list :purchase_old, 1, user: user
      end
    end

    trait :with_movie do
      association :purchases, factory: :purchase_one
    end
  end
end