
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
  
  def relacao_cintura_quadril
     q = cintura / quadril
     q.round(2)
  end
  
  def tmb
    d = ccorp_altura * 100
    age = student_age[:ano]
    peso = ccorp_peso
    l = 0.0
    if student.male?
       l = (66 + (13.7 * ccorp_peso) + (5.0 * d) - (6.8 * age))
    else
       l = (655 + (9.6 * ccorp_peso) + (1.8 * d) - (4.7 * age))
    end
    case amn_frequencia
      when 0 
         l = l * 1.2
      when (1..2)
         l = l * 1.375
      when (3..4)     
         l = l * 1.55
      when (5..6)
         l = l * 1.725
      when (7..10) 
         l = l * 1.9  
    end     
    l.to_i
  end

  def media_gordura
    age = student_age[:ano]
    r = " "
    if student.male?
      if (18..25).include?(age)
         r = "14,0 A 16,0%"
      end   
      if (26..35).include?(age)
         r = "18,0 A 20,0%"
      end   
      if (36..45).include?(age)
         r = "21,0 A 23,0%"
      end               
      if (46..55).include?(age)
         r = "24,0 A 25,0%"
      end               
      if (56..65).include?(age)
         r = "24,0 A 25,0%"
      end               
    else
      if (18..25).include?(age)
         r = "23,0 A 25,0%"
      end   
      if (26..35).include?(age)
         r = "24,0 A 25,0%"
      end   
      if (36..45).include?(age)
         r = "27,0 A 29,0%"
      end               
      if (46..55).include?(age)
         r = "29,0 A 31,0%"
      end               
      if (56..65).include?(age)
         r = "30,0 A 32,0%"
      end               
    end
    r
  end

  def relacao_cq
    age = student_age[:ano]
    r = " "
    if student.male?
       if (15..29).include?(age)
          r = "0,83 A 0,88  "
       end
       if (30..39).include?(age)
          r = "0,84 A 0,91"
       end
       if (40..49).include?(age)
          r = "0,88 A 0,95"
       end
       if (50..59).include?(age)
          r = "0,90 A 0,96  "
       end
       if (60..69).include?(age)
          r = "0,91 A 0,98  "
       end
    else
       if (15..29).include?(age)
          r = "0,71 A 0,77  "
       end
       if (30..39).include?(age)
          r = "0,72 A 0,78  "
       end
       if (40..49).include?(age)
          r = "0,73 A 0,79"
       end
       if (50..59).include?(age)
          r = "0,74 A 0,81  "
       end
       if (60..69).include?(age)
          r = "0,76 A 0,83    "
       end
    end   
       r
  end

  def classification_coporral_fat
    c = {:position => 0, :text => nil}

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
