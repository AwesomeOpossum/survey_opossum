class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission

  validates_presence_of :answer, :if => Proc.new { |a| a.question.required == true }

end
