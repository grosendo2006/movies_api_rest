FactoryBot.define do
  factory :episode do
    factory :sequence_episodes do
      sequence(:number) { |n| n }
      title             { "Episode: #{number}" }
      plot              { "plot" }
    end

    factory :random_episodes do
      number { rand(1000) }
      title  { "Episode: #{number}" }
      plot   { "plot" }
    end
  end
end