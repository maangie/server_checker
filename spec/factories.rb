FactoryGirl.define do
  factory :checker do
    type 1
  end

  factory :server do
    name 'www.example.com'
    checker
  end

  factory :advisory do
    email 'foo@example.com'
    server
  end
end
