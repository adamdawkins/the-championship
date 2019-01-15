class AddTeamIdToContestants < ActiveRecord::Migration[5.2]
  def change
    add_reference :contestants, :team, foreign_key: true
  end
end
