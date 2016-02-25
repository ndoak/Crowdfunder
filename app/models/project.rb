class Project < ActiveRecord::Base
  has_many :rewards
  has_many :pledges 
  belongs_to :owner, class_name: User, foreign_key: "user_id"
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def update_funding_goal(goal, reward_amount)
    new_goal = goal - reward_amount
    self.funding_goal = new_goal
    self.save
  end
  def start_or_now()
    [start_date, DateTime.now].max
  end

end
