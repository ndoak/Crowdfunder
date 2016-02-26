class AddRewardToPledges < ActiveRecord::Migration
  def change
    add_reference :pledges, :reward, index: true, foreign_key: true
  end
end
