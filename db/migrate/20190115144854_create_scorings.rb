class CreateScorings < ActiveRecord::Migration[5.2]
  def change
    create_table :scorings do |t|
      t.integer :amount
      t.references :task, index: true, foreign_key: true
      t.references :scoreable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
