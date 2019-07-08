FactoryBot.define do
  factory :customer do
    name { "MyString" }
  end

  factory :project do
    customer
    title { "MyString" }
  end

  factory :task_step do
    task
    started { "2019-07-08 11:19:05" }
    stopped { "2019-07-08 11:19:10" }
  end

  factory :task do
    project
    user
    description { "MyString" }

    factory :task_with_steps do
      transient do
        step_count { 5 }
      end

      after(:create) do |task, evaluator|
        create_list(:task_step, evaluator.step_count, task_id: task.id)
      end
    end
  end

  factory :user do
    username { 'testuser' }
    password { 'testpassword' }
    email    { 'testmail@test.com' }
  end
end
