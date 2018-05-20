class Score < ApplicationRecord
    has_one :question
    has_one :user
end
