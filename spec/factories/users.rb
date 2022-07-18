FactoryBot.define do
  factory :user do
    username {"User"}
    email {"abchaks9999@gmail.com"}
    password {"Abhi"}
    password_confirmation {"Abhi"}
    isadmin {false}

    trait :admin do
      isadmin {true}
    end

    factory :admin_user, traits: [:admin]
  end
end
