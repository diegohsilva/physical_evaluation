
class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    if params[:expired] == "true"
      @evaluations =  Evaluation.by_expired(Date.current + 7.day)  		
    else
      @evaluations = Evaluation.all      
    end  
    respond_with(@evaluations)
  end

  def show
    respond_with(@evaluation)
  end

  def new
    @evaluation = Evaluation.new
    @evaluation.student = Student.new
    @evaluation.evaluator = Evaluator.new
    @evaluation.evaluation_date = Date.current.strftime("%d/%m/%Y")
    @evaluation.end_date = Date.current.strftime("%d/%m/%Y")

    respond_with(@evaluation)
  end

  def edit
    @evaluation.evaluation_date = @evaluation.evaluation_date.strftime("%d/%m/%Y")
    @evaluation.end_date =  @evaluation.end_date.strftime("%d/%m/%Y")   
    @evaluation.student_name = @evaluation.student.name
    @evaluation.evaluator_name = @evaluation.evaluator.name 
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    @evaluation.save
    respond_with @evaluation, location: evaluations_path
  end

  def update
  
    @evaluation.update(evaluation_params)
    respond_with(@evaluation)
  end

  def destroy
    @evaluation.destroy
    respond_with(@evaluation)
  end

  private
    def set_evaluation
      @evaluation = Evaluation.find(params[:id])
    end

    def evaluation_params
      params.require(:evaluation).permit(:student_id, :evaluator_id, :evaluation_date, :end_date, :student_name, :evaluator_name, :front_photo, :side_photo, :back_photo, :front_contracted_photo, :back_contracted_photo, :Amn_AumentoMassa )
      params.require(:evaluation).permit(:student_id, :evaluator_id, :evaluation_date, :end_date, :student_name, :evaluator_name, :front_photo, :side_photo, :back_photo, :front_contracted_photo, :back_contracted_photo,:Amn_Desmaio,:Amn_AumentoMassa,:Amn_MelhoraAerobico,:Amn_Saude,:Amn_Fortalecimento,:Amn_Condicionamento,:Amn_PerdaPeso,:Amn_praticaAtividade,:Amn_Atividade,:Amn_Frequencia,:Amn_DorDorsal,:Amn_DorLombar,:Amn_DorCervical,:Amn_Limitacao,:Amn_Dor,:Amn_Cirurgia, :Amn_Medicamento,:Amn_problemaSaude,:Amn_FrequenciaRepouso,:Amn_PressaoRepouso,:Amn_ProblemaCardiado,:Amn_DorPeito,:Amn_DorPeitoUltimoMes,:Amn_ProblemaOsseo,:Amn_MedicamentoPressao,:Amn_impedimento,:Amn_Observacoes,:antebraco_direito,:antebraco_esquerdo,:braco_relaxado_direito,:braco_relaxado_esquerdo,:braco_contraido_direito,:braco_contraiddo_esquerdo,:coxa_proximal_direito,:coxa_proximal_esquerdo,:coxa_medial_direito,:coxa_medial_esquerdo,:coxa_distal_direito,:coxa_distal_esquerdo,:panturrilha_direito,:panturrilha_esquerdo,:abdomen,:quadril,:cintura,:torax,:ombro,:pescoco,:punho,:umero,:femur,:Ccorp_Jackson7,:Ccorp_Jackson3,:Ccorp_guedes,:Ccorp_bioimpedancia,:Ccorp_peso,:Ccorp_altura,:Ccorp_subescapular,:Ccorp_abdominal,:Ccorp_tricipital,:Ccorp_coxa,:Ccorp_peitoral,:Ccorp_supraIliaca,:Ccorp_AxilarMedia,:Ccorp_gordura)
    end
end
