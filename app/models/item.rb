class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_ship
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :title
    validates :text
    validates :image
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

  # 「整数のみ」と最大値最小値の設定
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  PRICE_REGEX = /\A[0-9]+\z/i.freeze
  validates :price, numericality: {with: PRICE_REGEX, message: 'には半角数字を使用してください' }


  # 下記はvalidates_format_of=文字列のバリデーションの時に使うものだからだめだった。今回は数字のものだから使えない
  # validates_format_of :price, with: PRICE_REGEX, message: 'には半角数字を使用してください' 

  # これは範囲指定は別のエラー文が出てくるから分けて記載したほうがいいということで分けた
  # validates :price, numericality: { with: PRICE_REGEX, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'には半角数字を使用してください' }
end


