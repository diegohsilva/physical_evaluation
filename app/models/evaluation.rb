class Evaluation < ActiveRecord::Base
  belongs_to :student
  belongs_to :evaluator

  validates :student_id, :evaluator_id, presence: true

  delegate :name, to: :student, prefix:  true 
  delegate :name, to: :evaluator, prefix: true

  def to_s
    name			
  end
end

