FactoryBot.define do
  factory :review do
    ratings {"test review"}
    isApproved {false}
    user
    restaurant    
  end
end
