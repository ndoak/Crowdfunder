class Reward < ActiveRecord::Base

  has_many :pledges
  belongs_to :project
  belongs_to :user


end
