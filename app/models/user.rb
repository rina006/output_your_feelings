class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :articles, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  validates :email, presence: true, uniqueness: true

  validates :password, length: { minimum: 6 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
end
