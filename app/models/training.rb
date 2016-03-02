class Training < ActiveRecord::Base
  belongs_to :student
  validates :name, :student_id, presence: true
  validates :name, uniqueness: true
end
