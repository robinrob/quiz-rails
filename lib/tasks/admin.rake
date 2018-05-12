namespace :admin do
  desc "Export Quiz Data as JSON"
  task export_quizzes: :environment do
    Quiz.all.each do |quiz|
      File.write("quiz_data/#{quiz.name}.json", quiz.as_json_mate)
    end
  end

  desc "Import Quiz Data as JSON"
  task import_quizzes: :environment do
    Dir.glob(Rails.root.join('quiz_data/*.json')) do |filename|
      quiz_json = JSON.parse(File.read(filename))
      questions_json = quiz_json["questions"]
      quiz_json.delete("id")
      quiz_json.delete("questions")

      # if Quiz.exists?(quiz_json["id"])
      #   Quiz.find(quiz_json["id"]).delete
      # end

      quiz = Quiz.create.from_json(JSON.dump(quiz_json))
      questions_json.each do |question_json|
        answers_json = question_json["answers"]
        question_json.delete("id")
        question_json.delete("answers")

        question_json["quiz_id"] = quiz.id
        question = Question.create.from_json(JSON.dump(question_json))
        question.save

        answers_json.each do |answer_json|
          answer_json.delete("id")
          answer_json["question_id"] = question.id
          answer = Answer.create.from_json(JSON.dump(answer_json))
          answer.save
        end
      end
      quiz.save
    end
    
  end
end
