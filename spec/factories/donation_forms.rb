FactoryBot.define do
  factory :donation_form do
    post_code { "123-4567" }
    delivery_area_id { 2 }
    city { "博多区" }
    address { "中洲１丁目"}
    buliding_name { "１−２" }
    phone { "09012345678" }
    user_id { 2 }
    item_id { 2 }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
