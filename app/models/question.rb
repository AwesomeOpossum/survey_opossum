class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :answers

  validates :question_text, presence: true
  validates :question_type, presence: true
  # validates :order_number, uniqueness:  { scope: :survey_id }
end
