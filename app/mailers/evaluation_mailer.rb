class EvaluationMailer < ApplicationMailer
  def notice(evaluation)
     @evaluation = evaluation
     mail :to => "#{evaluation.student.email}", :from => "#{evaluation.company.email}", :subject => "Avaliação física há vencer"
   end  
end
