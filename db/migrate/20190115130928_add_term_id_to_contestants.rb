class AddTermIdToContestants < ActiveRecord::Migration[5.2]
  def change
    add_reference :contestants, :term, foreign_key: true
  end
end
