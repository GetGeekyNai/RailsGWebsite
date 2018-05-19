FactoryBot.define  do

  factory :user do
    name "Code Girl"
    email "codegirl@gmail.com"
    phone_number 1234567963
    password "asdf1234"
    password_confirmation "asdf1234"
  end
  factory :userx, class: User do
    name nil
    email nil
  end
end
