class ExerciseTraining < ActiveRecord::Base
  belongs_to :exercise
  belongs_to :training

  validates :exercise_id, :training_id, presence: true
  validates :exercise_id, uniqueness: true

  def to_s
  	exercise	
  end
end
