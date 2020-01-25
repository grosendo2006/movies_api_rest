FactoryBot.define do
  factory :season do
    factory :got_one do
      title      { 'Game Of Thrones' }
      plot       { 'plot' }
      number     { 1 }
      created_at { Time.zone.now - 4.days }
    end

    factory :got_two do |season|
      title      { 'Game Of Thrones' }
      plot       { 'plot' }
      number     { 2 }
      created_at { Time.zone.now - 3.days }
    end

    factory :breaking_bad_one do
      title      { 'Breaking Bad' }
      plot       { 'plot' }
      number     { 1 }
      created_at { Time.zone.now - 1.days }
    end

    trait :with_episodes do
      after :create do |season|
        create_list :sequence_episodes, 8, season: season
        create_list :random_episodes, 3, season: season
      end
    end

  end
end
