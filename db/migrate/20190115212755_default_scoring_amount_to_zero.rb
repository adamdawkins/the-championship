class DefaultScoringAmountToZero < ActiveRecord::Migration[5.2]
  def change
    Scoring.where(amount: nil).update_all(amount: 0)
    change_column :scorings, :amount, :integer, default: 0, null: false
  end
end
