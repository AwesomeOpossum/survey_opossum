class Survey < ActiveRecord::Base
  belongs_to :author
  has_many :questions, dependent: :destroy

  validates :title, presence: true
  validates :description, presence: true
  validates :author_id, presence: true
  


  accepts_nested_attributes_for :questions,
      reject_if: proc { |attributes| attributes['question_text'].blank? },
      allow_destroy: true
end
