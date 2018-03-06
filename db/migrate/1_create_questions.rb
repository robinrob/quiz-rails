class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
    end

    create_table :answers do |t|
      t.string :text
    end

    create_table :scores do |t|
      t.integer :value
    end

    create_table :question_answers do |t|
      t.integer :question_id
      t.integer :answer_id
      t.integer :score_id
    end
  end
end
