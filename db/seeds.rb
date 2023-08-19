# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


prefectures = [
  { id: 1, prefecture_name: "北海道", created_at: Time.current, updated_at: Time.current },
  { id: 2, prefecture_name: "青森県", created_at: Time.current, updated_at: Time.current },
  { id: 3, prefecture_name: "岩手県", created_at: Time.current, updated_at: Time.current },
  { id: 4, prefecture_name: "宮城県", created_at: Time.current, updated_at: Time.current },
  { id: 5, prefecture_name: "秋田県", created_at: Time.current, updated_at: Time.current },
  { id: 6, prefecture_name: "山形県", created_at: Time.current, updated_at: Time.current },
  { id: 7, prefecture_name: "福島県", created_at: Time.current, updated_at: Time.current },
  { id: 8, prefecture_name: "茨城県", created_at: Time.current, updated_at: Time.current },
  { id: 9, prefecture_name: "栃木県", created_at: Time.current, updated_at: Time.current },
  { id: 10, prefecture_name: "群馬県", created_at: Time.current, updated_at: Time.current },
  { id: 11, prefecture_name: "埼玉県", created_at: Time.current, updated_at: Time.current },
  { id: 12, prefecture_name: "千葉県", created_at: Time.current, updated_at: Time.current },
  { id: 13, prefecture_name: "東京都", created_at: Time.current, updated_at: Time.current },
  { id: 14, prefecture_name: "神奈川県", created_at: Time.current, updated_at: Time.current },
  { id: 15, prefecture_name: "新潟県", created_at: Time.current, updated_at: Time.current },
  { id: 16, prefecture_name: "富山県", created_at: Time.current, updated_at: Time.current },
  { id: 17, prefecture_name: "石川県", created_at: Time.current, updated_at: Time.current },
  { id: 18, prefecture_name: "福井県", created_at: Time.current, updated_at: Time.current },
  { id: 19, prefecture_name: "山梨県", created_at: Time.current, updated_at: Time.current },
  { id: 20, prefecture_name: "長野県", created_at: Time.current, updated_at: Time.current },
  { id: 21, prefecture_name: "岐阜県", created_at: Time.current, updated_at: Time.current },
  { id: 22, prefecture_name: "静岡県", created_at: Time.current, updated_at: Time.current },
  { id: 23, prefecture_name: "愛知県", created_at: Time.current, updated_at: Time.current },
  { id: 24, prefecture_name: "三重県", created_at: Time.current, updated_at: Time.current },
  { id: 25, prefecture_name: "滋賀県", created_at: Time.current, updated_at: Time.current },
  { id: 26, prefecture_name: "京都府", created_at: Time.current, updated_at: Time.current },
  { id: 27, prefecture_name: "大阪府", created_at: Time.current, updated_at: Time.current },
  { id: 28, prefecture_name: "兵庫県", created_at: Time.current, updated_at: Time.current },
  { id: 29, prefecture_name: "奈良県", created_at: Time.current, updated_at: Time.current },
  { id: 30, prefecture_name: "和歌山県", created_at: Time.current, updated_at: Time.current },
  { id: 31, prefecture_name: "鳥取県", created_at: Time.current, updated_at: Time.current },
  { id: 32, prefecture_name: "島根県", created_at: Time.current, updated_at: Time.current },
  { id: 33, prefecture_name: "岡山県", created_at: Time.current, updated_at: Time.current },
  { id: 34, prefecture_name: "広島県", created_at: Time.current, updated_at: Time.current },
  { id: 35, prefecture_name: "山口県", created_at: Time.current, updated_at: Time.current },
  { id: 36, prefecture_name: "徳島県", created_at: Time.current, updated_at: Time.current },
  { id: 37, prefecture_name: "香川県", created_at: Time.current, updated_at: Time.current },
  { id: 38, prefecture_name: "愛媛県", created_at: Time.current, updated_at: Time.current },
  { id: 39, prefecture_name: "高知県", created_at: Time.current, updated_at: Time.current },
  { id: 40, prefecture_name: "福岡県", created_at: Time.current, updated_at: Time.current },
  { id: 41, prefecture_name: "佐賀県", created_at: Time.current, updated_at: Time.current },
  { id: 42, prefecture_name: "長崎県", created_at: Time.current, updated_at: Time.current },
  { id: 43, prefecture_name: "熊本県", created_at: Time.current, updated_at: Time.current },
  { id: 44, prefecture_name: "大分県", created_at: Time.current, updated_at: Time.current },
  { id: 45, prefecture_name: "宮崎県", created_at: Time.current, updated_at: Time.current },
  { id: 46, prefecture_name: "鹿児島県", created_at: Time.current, updated_at: Time.current },
  { id: 47, prefecture_name: "沖縄県", created_at: Time.current, updated_at: Time.current }
]

Prefecture.insert_all(prefectures)


