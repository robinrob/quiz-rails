class Quiz < ApplicationRecord
  has_many :questions
  
  def questions_selection(user_id, number=10)
    user_questions_generator = Enumerator.new do
      |generator|
      Score.where(user_id: user_id, bonus: 0).each do 
        |score|
        generator.yield Question.find(score.question_id)
      end
    end
    questions_generator = Enumerator.new do
      |generator|
      Question.find(quiz_id: self.id).shuffle.each do
        |question|
        generator.yield question
      end
    end
    
    questions = []
    (1..number).each do |index|
      if next_or_nil(user_questions_generator)
        questions << user_questions_generator.next
      elsif next_or_nil(questions_generator)
        questions << questions_generator.next
      else
        break
      end
    end
    questions
  end

  def next_or_nil(generator)
   begin 
      generator.peek
   rescue StopIteration => e
      Nil
   end
  end
end
  