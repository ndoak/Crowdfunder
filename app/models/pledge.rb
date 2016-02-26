class Pledge < ActiveRecord::Base


  belongs_to :user
  has_one :project, through: :rewards
  belongs_to :reward

end
