
class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy, :send_email]

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
    @evaluation.company_id = current_company.id
    @evaluation.student = Student.new
    @evaluation.evaluator = Evaluator.new
    @evaluation.evaluation_date = Date.current.strftime("%d/%m/%Y")
    @evaluation.end_date = Date.current + 6.month    
    @evaluation.end_date = @evaluation.end_date.strftime("%d/%m/%Y") 

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
    respond_with(@evaluation)
  end

  def send_email
    
    EvaluationMailer.notice(@evaluation).deliver_now
    flash[:notice] = 'Email enviando com sucesso.'    
    redirect_to root_path
    
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
      params.require(:evaluation).permit(:company_id, :student_id, :evaluator_id, :evaluation_date, :end_date, :student_name, :evaluator_name, :front_contracted_photot_photo, :side_photo, :back_photo, :front_contracted_photo, :back_contracted_photo,:amn_aumentomassa, :amn_desmaio,:amn_aumentoMassa,:amn_melhoraaerobico,:amn_saude,:amn_fortalecimento,:amn_condicionamento,:amn_perdapeso,:amn_praticaatividade,:amn_atividade,:amn_frequencia,:amn_dordorsal,:amn_dorlombar,:amn_dorcervical,:amn_limitacao,:amn_dor,:cirurgia, :amn_medicamento,:amn_problemasaude,:amn_frequenciarepouso,:amn_pressaorepouso,:amn_problemacardiado,:amn_dorpeito,:amn_dorpeitoultimomes,:amn_problemaosseo,:amn_medicamentopressao,:amn_impedimento,:amn_observacoes,:antebraco_direito,:antebraco_esquerdo,:braco_relaxado_direito,:braco_relaxado_esquerdo,:braco_contraido_direito,:braco_contraiddo_esquerdo,:coxa_proximal_direito,:coxa_proximal_esquerdo,:coxa_medial_direito,:coxa_medial_esquerdo,:coxa_distal_direito,:coxa_distal_esquerdo,:panturrilha_direito,:panturrilha_esquerdo,:abdomen,:quadril,:cintura,:torax,:ombro,:pescoco,:punho,:umero,:femur,:ccorp_jackson7,:ccorp_jackson3,:ccorp_guedes,:ccorp_bioimpedancia,:ccorp_peso,:ccorp_altura,:ccorp_subescapular,:ccorp_abdominal,:ccorp_tricipital,:ccorp_coxa,:ccorp_peitoral,:ccorp_supraIliaca,:ccorp_axilarmedia,:ccorp_gordura,:photo_lateral_direita,:photo_lateral_esquerda,:photo_posterior,:photo_anterior,:anterversao_de_quadril,:retroversao_de_quadril,:rotacao_interna_ombros,:retificacao_cervical,:retificacao_lombar,:protusao_abdominal,:hiperlordose_cervical,:hiperlordose_lombar,:hipercifose_toracica,:pe_plano,:pe_cavo,:pe_calcaneo,:pe_equino,:genu_flexo,:genu_recurvado,:escoliose_cervical,:escoliose_toracica,:escoliose_lombar,:protacao_escapular,:retracao_escapular,:depressao_escapular,:pe_vago,:pe_varo,:encurtamento_de_trapezio,:genu_valgo,:genu_varo,:pe_aduto,:pe_abduto,:ombros_assimetricos,:assimetria_quadril,:observacoes, :cirugia, :info_cirugia, :data_cirugia, :jackson_e_pollock_5_dobras)            
    end
end
