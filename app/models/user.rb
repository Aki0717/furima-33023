class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      with_options presence: true do
         validates :nickname
         validates :birth_date
         validates :encrypted_password
      end

        PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
        validates_format_of :encrypted_password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

      with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: '全角文字を使用してください' } do
        validates :first_name, presence: true
        validates :last_name, presence: true
      end

      with_options presence: true, format: { with:/\A[ァ-ヶ]+\z/, message: '全角カタカナを使用してください' } do
        validates :kana_first_name
        validates :kana_last_name
      end


      has_many :items
      has_many :orders
end
