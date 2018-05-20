class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name, :null => false
    end
    
    create_table :questions do |t|
      t.string :title, :null => false
      t.integer :quiz_id, :null => false
    end

    create_table :answers do |t|
      t.string :text, :null => false
      t.integer :question_id, :null => false
    end
  end
end
