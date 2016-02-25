class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :owner, foreign_key: "user_id"
  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

  def update_funding_goal(goal, reward_amount)
    new_goal = goal - reward_amount
    self.funding_goal = new_goal
    self.save
  end

  def time_left()
    remaining_time = end_date - start_date
  end
end
