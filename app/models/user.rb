class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
  validates :email, confirmation: true
  validates :email, uniqueness: true
end
