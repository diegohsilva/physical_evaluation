class Evaluation < ActiveRecord::Base
  belongs_to :student
  belongs_to :evaluator
  validates :student_id, :evaluator_id, presence: true

  
end

