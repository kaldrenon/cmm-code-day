FactoryBot.define do
  factory :item do
    numfield { 1 }
    textfield { "MyText" }
    title { "MyString" }
  end

  factory :user do
    username { 'testuser' }
    password { 'testpassword' }
    email    { 'testmail@test.com' }
  end
end
