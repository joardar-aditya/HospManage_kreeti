FactoryBot.define do
  factory :patient do
    name { "abc" }
    age { 24 }
    disease { "abc"}
    admitted { false }
    email { "abc@email.com" }
    phone { "1112223334" }
  end
end
