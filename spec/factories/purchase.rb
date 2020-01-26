FactoryBot.define do
  factory :purchase do
    factory :purchase_one do
      association :purchase_option, factory: :purchase_option_three
      association :user
    end

    factory :purchase_old do
      association :purchase_option, factory: :purchase_option_four
      association :user
      created_at { Time.zone.now - 3.days }
    end
  end
end