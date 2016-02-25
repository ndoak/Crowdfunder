class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :owned_projects, class_name: 'Project'
  has_many :backed_projects, class_name: 'Project', through: :rewards

  validates :password, confirmation: true
  validates :email, confirmation: true
  validates :email, uniqueness: true
end
