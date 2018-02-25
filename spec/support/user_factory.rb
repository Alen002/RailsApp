FactoryBot.define do #No factories outside of this block

  factory :user do
    email "do@go.com"
    password "1234567890"
    first_name "Amber"
    last_name "Second"
    admin false
  end

end#End of the block
