class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title
    end

    create_table :answers do |t|
      t.string :text
      t.integer :question_id
      t.integer :score_id
    end

    create_table :scores do |t|
      t.integer :value
    end
  end
end
