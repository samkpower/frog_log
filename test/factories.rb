FactoryGirl.define do
  factory :user do
    first_name            "Tyler"
    last_name             "Sangster"
    email                 "tyler.sangster@gmail.com"
    password              "foobar"
    password_confirmation "foobar"

    factory :user_two do
      first_name            "Najwa"
      last_name             "Azer"
      email                 "najwa.azer@gmail.com"
      password              "foobar"
      password_confirmation "foobar"
    end

    factory :admin_user do
      first_name            "Admin"
      last_name             "User"
      email                 "admin@example.com"
      password              "foobar"
      password_confirmation "foobar"
      admin                 true
    end
  end

  factory :review do
    user               
    score                   5
    title                   "This is a review"
    content                 "Hello, this is a review. Hello, this is a review. Hello, this is a review. Hello, this is a review. "
  end

  factory :vote do
    user
    review
    kind                    "up"

    factory :downvote do
      user
      review
      kind                  "down"
    end
  end
end