class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission

  validates :answer, presence: true
end
