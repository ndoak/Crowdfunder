class Project < ActiveRecord::Base


  has_many :rewards
  has_many :pledges
  belongs_to :owner, class_name: User, foreign_key: "user_id"

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true
  validates_presence_of :title, :description, :funding_goal, :start_date, :end_date

  validate :end_date_is_after_start_date

  def start_or_now()
    [start_date, DateTime.now].max
  end

  def update_funding_goal(reward_amount)
    new_goal = self.funding_goal - reward_amount
    self.funding_goal = new_goal
    self.save
  end

  def project_expire()

    if DateTime.now >= end_date
      errors.add(:end_date, "Project is over")
        return true
      else
        return false
      end
    end

      def money_rasied()

      end



  private
    def end_date_is_after_start_date
      return if end_date.blank? || start_date.blank?

      if end_date < start_date
        errors.add(:end_date, "cannot be before the start date. Idiot.")
      end
    end

end
