FactoryGirl.define do
  factory :user do
    name     "Børge Lotre"
    email    "borge.lotre@gmail.com"
    password "foobar"
    password_confirmation "foobar"
  end
end