require 'csv'

class ImportQuestions < ActiveRecord::Migration[5.1]
  def self.up
    csv_text = File.read('capitals.csv')
    csv = CSV.parse(csv_text, :headers => true)

    quiz = Quiz.create(name: 'Capitals')
    csv.each do |row|
      question = Question.create(title: row["Question"], quiz_id: quiz.id)
      row["Answers"].split("::").each {|answer| Answer.create(text: answer, question_id: question.id)}
    end
  end

  def self.down
    Quiz.delete_all
    Question.delete_all
    Answer.delete_all
  end
end
