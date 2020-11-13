FactoryBot.define do
  factory :end_user do
    email: "test@test"
    encrypted_password: "000000"
    name: "test"
    birthday: "2000-01-01"
    postal_code: "1111111"
  end
end
