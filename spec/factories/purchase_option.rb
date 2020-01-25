FactoryBot.define do
  factory :purchase_option do
    factory :purchase_option_one do
      price         { 99 }
      video_quality { 'HD' }
    end

    factory :purchase_option_two do
      price         { 49 }
      video_quality { 'SD' }
    end

    trait :with_movie do
      association :content, factory: :batman_one
    end

    trait :with_season do
      association :content, factory: :got_one
    end
  end
end