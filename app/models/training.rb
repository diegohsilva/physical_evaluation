class Training < ActiveRecord::Base
  belongs_to :student
  has_many :exercise_trainings
  
  accepts_nested_attributes_for :exercise_trainings, reject_if: :all_blank, allow_destroy: true

  validates :name, :student_id, presence: true
  validates :name, uniqueness: true
end
