class Quiz < ApplicationRecord
  has_many :questions

  def as_json_mate
    self.to_json(:include => { :questions => { :include => { :answers => {} } }})
  end
end
  