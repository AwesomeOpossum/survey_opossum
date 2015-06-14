class Survey < ActiveRecord::Base
  belongs_to :author

  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions,
      reject_if: proc { |attributes| attributes['question_text'].blank? },
      allow_destroy: true
end
