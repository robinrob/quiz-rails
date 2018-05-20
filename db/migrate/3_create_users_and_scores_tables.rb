class CreateUsersAndScoresTables < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :username, :null => false
    end
    
    create_table :scores do |t|
      t.integer :user_id, :null => false
      t.integer :question_id, :null => false
      t.integer :bonus, :null => false, :default => 0
    end
  end
end
