class AddUserToRewards < ActiveRecord::Migration
  def change
    add_reference :rewards, :user, index: true, foreign_key: true
  end
end
