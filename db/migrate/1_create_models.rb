class CreateModels < ActiveRecord::Migration[5.1]
  def change
    create_table :quizzes do |t|
      t.string :name
    end
    
    create_table :questions do |t|
      t.string :title
      t.integer :quiz_id
    end

    create_table :answers do |t|
      t.string :text
      t.integer :question_id
    end
  end
end
