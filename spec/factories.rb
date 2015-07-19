FactoryGirl.define do
  factory :user do
    name  'なまえ'
    email 'aiueo@mail.com'
    password 'foobar'
    password_digest 'foobar'
  end
end
