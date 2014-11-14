FactoryGirl.define do
  factory :server do
    name 'www.example.com'
  end

  factory :advisory do
    email 'foo@example.com'
    server
  end
end
