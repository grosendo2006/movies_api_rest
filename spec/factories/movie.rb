FactoryBot.define do
  factory :movie do
    factory :batman_one do
      title      { 'Batman Begins' }
      plot       { 'plot' }
      created_at { Time.zone.now - 2.days }
    end

    factory :batman_two do
      title      { 'Batman the dark knight' }
      plot       { 'plot' }
      created_at { Time.zone.now - 1.days }
    end

    factory :batman_three do
      title      { 'Batman the dark knight rises' }
      plot       { 'plot' }
      created_at { Time.zone.now - 3.days }
    end

  end
end
