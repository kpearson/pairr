FactoryGirl.define do
  factory :user do
    name "Alice"
    email "alice@example.com"
    bio "My life is a little hecktic from time to time, but I like to pair when I can."
    uid "123456789"
    provider "github"
    token "123456789"
    image_url "http://github.com/12345"
  end

end
