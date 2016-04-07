
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
  
  def classification_imc
      if student.male?
        if imc > 43
          "Obsidade mórbida"
        elsif (30..39.9).include?(imc)
          "Obsidade moderada"
        elsif (25..29.9).include?(imc)
          "Obesidade leve"
        elsif (20..24.9).include?(imc)
          "Obesidade normal"
        elsif 20
          "Obesidade abaixo do normal"
        end     
      else
        
      end
  end

end
