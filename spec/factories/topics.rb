# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :topic do
    uuid "MyString"
    title "MyString"
    description "MyText"
  end
end
