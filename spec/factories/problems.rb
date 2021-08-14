FactoryBot.define do
  factory :problem do
    setter         {Faker::Lorem.sentence}
    area           {Faker::Lorem.sentence}
    memo           {Faker::Lorem.sentence}
    grade_id       { 2 }
    climb_done_id  { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
