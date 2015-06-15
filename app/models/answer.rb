class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission

  validates :question_id, presence: true
  validates :answer, presence: true
end
