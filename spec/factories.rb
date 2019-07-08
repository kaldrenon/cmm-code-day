FactoryBot.define do
  factory :task_step do
    task_id { 1 }
    started { "2019-07-08 11:19:05" }
    stopped { "2019-07-08 11:19:05" }
  end

  factory :task do
    project_id { 1 }
    description { "MyString" }
    customer_id { 1 }
    project_id { 1 }
  end

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
