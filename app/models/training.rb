class Training < ActiveRecord::Base
  attr_accessor :student_name

  belongs_to :student
  has_many :exercise_trainings
  accepts_nested_attributes_for :exercise_trainings, reject_if: :all_blank, allow_destroy: true
  has_enumeration_for :week_day, with: WeekDay
	

  validates :student_name, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true
  
  scope :by_week_day, lambda { |wd| where("trainings.week_day = ?", wd) }
  

end
