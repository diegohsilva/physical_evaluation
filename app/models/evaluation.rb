class Evaluation < ActiveRecord::Base
  attr_accessor :student_name
  attr_accessor :evaluator_name

  belongs_to :student
  belongs_to :evaluator

  validates :student_id, :evaluator_id, presence: true
  validates :student_name, presence: true  

	scope :by_expired, lambda { |date| where("evaluations.end_date = ?", date) }

  def to_s
    name			
  end
  
end