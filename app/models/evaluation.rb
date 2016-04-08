
class Evaluation < ActiveRecord::Base
  attr_accessor :student_name
  attr_accessor :evaluator_name

  belongs_to :student
  belongs_to :evaluator
  
  mount_uploader :front_photo,FrontPhotoUploader
  mount_uploader :side_photo, SidePhotoUploader
  mount_uploader :back_photo, BackPhotoUploader
  mount_uploader :front_contracted_photo, FrontContractedPhotoUploader
  mount_uploader :back_contracted_photo, BackContractedPhotoUploader
  
  validates :student_name, :evaluator_name, presence: true
  validates :student_name, :evaluator_name, presence: true  
  validates_date :end_date, after: :evaluation_date, :after_message => "Data de vencimento não pode ser menor que data da avaliação"

  scope :by_expired, lambda { |date| where("evaluations.end_date = ?", date) }

  def to_s
     name			
  end
  
  def imc
    c = ccorp_altura * ccorp_altura 
      (ccorp_peso / c).round(2)
  end
  def gordura
    peso_libra = ccorp_peso * 2.20462262
    item2 = (peso_libra * 1.082) + 94.42
    circunferencia_cintura = cintura * 0.393700787
    massa_magra = item2 - (circunferencia_cintura * 4.15)
    #gorduracorporal = ((peso_libra - massa_magra) * 100) / peso_libra
    (((peso_libra - massa_magra) * 100) / peso_libra).round(2)
  end
  def massa_magra
    peso_libra = ccorp_peso * 2.20462262
    item2 = (peso_libra * 1.082) + 94.42
    circunferencia_cintura = cintura * 0.393700787
    massa_magra_percent = item2 - (circunferencia_cintura * 4.15)
    ((massa_magra_percent * 100)/peso_libra).round(2)
  end
  def classification_imc
      if student.male?
        if imc > 43
          "Obsidade mórbida"
        elsif (30..39.9).include?(imc)
          "Obsidade moderada"
        elsif (25..29.9).include?(imc)
          "Obesidade leve"
        elsif (20..24.9).include?(imc)
          "Normal"
        elsif imc < 20
          "Abaixo do normal"
        end     
      else
        if imc > 39
          "Obsidade mórbida"
        elsif (29..38.9).include?(imc)
          "Obsidade moderada"
        elsif (24..28.9).include?(imc)
          "Obesidade leve"
        elsif (19..23.9).include?(imc)
          "Normal"
        elsif imc < 19
          "Abaixo do normal"
        end             
      end
  end

end
