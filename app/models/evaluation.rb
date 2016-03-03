class Evaluation < ActiveRecord::Base
  belongs_to :student
  belongs_to :evaluator

  validates :student_id, :evaluator_id, presence: true

  delegate :name, to: :student, prefix:  true 
  delegate :name, to: :evaluator, prefix: true
	
	scope :by_expired, lambda { |date| where("evaluations.end_date = ?", date) }

  def to_s
    name			
  end
end

