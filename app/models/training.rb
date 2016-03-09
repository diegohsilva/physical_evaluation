class Training < ActiveRecord::Base
  attr_accessor :student_name

  belongs_to :student
  has_many :exercise_trainings

  validates :student_name, presence: true

  accepts_nested_attributes_for :exercise_trainings, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :name, uniqueness: true
end
