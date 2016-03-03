class Training < ActiveRecord::Base
  belongs_to :student
  has_many :exercise_trainings
  delegate :name, to: :student, prefix: true  
  accepts_nested_attributes_for :exercise_trainings, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true
end
