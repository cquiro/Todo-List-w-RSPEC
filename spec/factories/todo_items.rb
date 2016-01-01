# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo_item do
    todo_list nil
    content "MyString"
  end
end
