class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :date_of_birth_id, presence: true

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: '全角文字を使用してください' } do
    validates :hiragana_name_first
    validates :hiragana_name_last
  end

  with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角カナを使用してください' } do
    validates :katakana_name_first
    validates :katakana_name_last
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'need to be half-width alphanumeric mixed'
end
