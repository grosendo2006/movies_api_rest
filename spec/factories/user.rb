FactoryBot.define do
  factory :user do
    factory :user_one do
      email { 'one@one.com' }
    end

    factory :user_two do
      email { 'two@two.com' }
    end

  end
end