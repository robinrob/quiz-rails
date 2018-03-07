require 'csv'

class ImportQuestions < ActiveRecord::Migration[5.1]
  def self.up
    score0 = Score.create(value: 0)
    score5 = Score.create(value: 5)
    score10 = Score.create(value: 10)
    score15 = Score.create(value: 15)

    csv_text = File.read('questions.csv')
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      puts "row: #{row.to_hash}"

      question = Question.create(title: row["Question"])
      answer0 = Answer.create(text: row["0 points"])
      answer1 = Answer.create(text: row["5 points"])
      answer2 = Answer.create(text: row["10 points"])
      answer3 = Answer.create(text: row["15 points"])

      QuestionAnswer.create(question_id: question.id, answer_id: answer0.id, score_id: score0.id)
      QuestionAnswer.create(question_id: question.id, answer_id: answer1.id, score_id: score5.id)
      QuestionAnswer.create(question_id: question.id, answer_id: answer2.id, score_id: score10.id)
      QuestionAnswer.create(question_id: question.id, answer_id: answer3.id, score_id: score15.id)
    end
  end

  def self.down
    puts 'HERE'

    QuestionAnswer.delete_all
    Question.delete_all
    Answer.delete_all
    Score.delete_all
  end
end