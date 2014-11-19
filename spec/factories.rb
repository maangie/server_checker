FactoryGirl.define do
  factory :server do
    name 'www.example.com'
    check_type 1
  end

  factory :advisory do
    email 'foo@example.com'
    server
  end
end
