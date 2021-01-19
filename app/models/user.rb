class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      validates :email, unique: true
      validates :nickname, presence: true
      validates :first_name, presence: true
      validates :last_name, presence: true

      with_option presence: true, format: { with:/\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
        validates :kana_first_name
        validates :kana_last_name
      end
      
      validates :birth_date, presence: true
end
