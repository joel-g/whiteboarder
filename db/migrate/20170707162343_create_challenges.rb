class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :question, null: false
      t.string :solution
      t.integer :difficulty
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
