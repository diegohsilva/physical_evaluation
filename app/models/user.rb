class User < ActiveRecord::Base
  belongs_to :student
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :timeoutable

  def to_s
  	 student if student.present?
  end
end
