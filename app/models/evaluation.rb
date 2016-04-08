
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
  
  delegate :age, to: :student, prefix: true
  
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
  
  def classification_coporral_fat
    c = {:position => nil, :text => nil}

     age = student_age[:ano]
     g = gordura

     if student.male?
        if (18..25).include?(age)
  
          if  (4..6).include?(g)
           c =  "Excelente"
          end  
        
          if  (8..10).include?(g)
            c = "Bom"
          end  
        
          if  (12..13).include?(g)
            c = "Acima da média"
          end  
        
          if  (14..16).include?(g)
            c = "Média"
          end  
        
          if  (17..20).include?(g)
            c = "Abaixo da média"
          end
        
          if  (20..24).include?(g)
            c = "Ruim"
          end 
        
          if  (26..36).include?(g)
            c = "Muito ruim"
          end  
        end
        
        if (26..35).include?(age)
            if g < 8
               c[:text] = "Excelente"        
               c[:position] = 1                       
            end 
              
            if  (8..11).include?(g) 
              c = "Excelente"
            end  

            if  (12..15).include?(g)
              c[:text] = "Bom"
              c[:position] = 1
            end  

            if  (16..18).include?(g)
              c[:text] = "Acima da média"
              c[:position] = 1 
            end  

            if  (18..20).include?(g)
              c[:text] = "Média"
              c[:position] = 0
            end  

            if  (22..24).include?(g)
              c[:text] = "Abaixo da média"
              c[:position] = -1
            end

            if  (20..24).include?(g)
              c[:text] = "Ruim"
              c[:position] = -1              
            end 
            
            if  (28..36).include?(g) || g >= 36 
              c[:text] = "Muito ruim"
              c[:position] = -1
              
            end  
        end
      else
              
      end
      c
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
