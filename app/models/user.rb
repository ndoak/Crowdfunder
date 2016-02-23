class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, confirmation: true
end
