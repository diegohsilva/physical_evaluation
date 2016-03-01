class AddFieldsAnamneseToEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :Amn_AumentoMassa,      :boolean
  	add_column :evaluations, :Amn_MelhoraAerobico,   :boolean
  	add_column :evaluations, :Amn_Saude,             :boolean
  	add_column :evaluations, :Amn_Fortalecimento,    :boolean
  	add_column :evaluations, :Amn_Condicionamento,   :boolean
  	add_column :evaluations, :Amn_PerdaPeso,         :boolean
  	add_column :evaluations, :Amn_praticaAtividade,  :boolean
  	add_column :evaluations, :Amn_Atividade,         :string, limit: 30
  	add_column :evaluations, :Amn_Frequencia,        :integer
  	add_column :evaluations, :Amn_DorDorsal,         :boolean
  	add_column :evaluations, :Amn_DorLombar,         :boolean
  	add_column :evaluations, :Amn_DorCervical,       :boolean
  	add_column :evaluations, :Amn_Limitacao,         :boolean
  	add_column :evaluations, :Amn_Dor,               :string, limit: 40
  	add_column :evaluations, :Amn_Cirurgia,          :string, limit: 50
  	add_column :evaluations, :Amn_Medicamento,       :string, limit: 50
  	add_column :evaluations, :Amn_problemaSaude,     :string, limit: 30
  	add_column :evaluations, :Amn_FrequenciaRepouso, :string
  	add_column :evaluations, :Amn_PressaoRepouso,    :string, limit: 10
  	add_column :evaluations, :Amn_ProblemaCardiado,  :boolean
  	add_column :evaluations, :Amn_DorPeito,          :boolean
  	add_column :evaluations, :Amn_DorPeitoUltimoMes, :boolean
  	add_column :evaluations, :Amn_Desmaio,           :boolean
  	add_column :evaluations, :Amn_ProblemaOsseo,     :boolean
  	add_column :evaluations, :Amn_MedicamentoPressao,:boolean
  	add_column :evaluations, :Amn_impedimento,       :boolean
  	add_column :evaluations, :Amn_Observacoes,       :string, limit: 300
  end
end
