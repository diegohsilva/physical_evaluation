class Training < ActiveRecord::Base
  attr_accessor :student_name, :coach_name

  belongs_to :student
  belongs_to :coach
  has_many :exercise_trainings, dependent: :destroy
  accepts_nested_attributes_for :exercise_trainings, reject_if: :all_blank, allow_destroy: true
	

  validates :name, :coach_name, :student_name, presence: true
  validates :name, uniqueness: true
  validate :dias_semana
  
  scope :by_week_day, lambda { |wd| where("trainings.week_day = ?", wd) }
  
  def wdays
    wd = []
    if segunda
      wd << 1
    end
    if terca
      wd << 2
    end
    if quarta
      wd << 3
    end
    if quinta
      wd << 4
    end
    if sexta
      wd << 5
    end
    if sabado
      wd << 6
    end
    if domingo
      wd << 0
    end    
    
    
    
    wd
  end
  
  def string_week_day
    wd = ""
    if segunda
      wd = wd  + " Segunda "
    end
    if terca
      wd = wd  + " Terça "
    end
    if quarta
      wd = wd  + " Quarta "
    end
    if quinta
      wd = wd  + " Quinta "
    end
    if sexta
      wd = wd  + " Sexta "
    end
    if sabado
      wd = wd  + " Sabado "
    end
    if domingo
      wd = wd  + " Domingo "
    end    
    
    
    
    wd
  end
  private
  
  def dias_semana    
    if segunda == false && terca == false && quarta == false &&  quinta == false && sexta == false && sabado == false  && domingo == false
      errors.add(:domingo, "Informe o dia da semana") 
    end
  end

end
