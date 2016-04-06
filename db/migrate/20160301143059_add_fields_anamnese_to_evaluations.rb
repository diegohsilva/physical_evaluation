class AddFieldsAnamneseToEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :amn_aumentomassa,      :boolean
  	add_column :evaluations, :amn_melhoraaerobico,   :boolean
  	add_column :evaluations, :amn_saude,             :boolean
  	add_column :evaluations, :amn_fortalecimento,    :boolean
  	add_column :evaluations, :amn_condicionamento,   :boolean
  	add_column :evaluations, :amn_perdapeso,         :boolean
  	add_column :evaluations, :amn_praticaatividade,  :boolean
  	add_column :evaluations, :amn_atividade,         :string, limit: 30
  	add_column :evaluations, :amn_frequencia,        :integer
  	add_column :evaluations, :amn_dordorsal,         :boolean
  	add_column :evaluations, :amn_dorlombar,         :boolean
  	add_column :evaluations, :amn_dorcervical,       :boolean
  	add_column :evaluations, :amn_limitacao,         :boolean
  	add_column :evaluations, :amn_dor,               :string, limit: 40
  	add_column :evaluations, :amn_cirurgia,          :string, limit: 50
  	add_column :evaluations, :amn_medicamento,       :string, limit: 50
  	add_column :evaluations, :amn_problemasaude,     :string, limit: 30
  	add_column :evaluations, :amn_frequenciarepouso, :string
  	add_column :evaluations, :amn_pressaorepouso,    :string, limit: 10
  	add_column :evaluations, :amn_problemacardiado,  :boolean
  	add_column :evaluations, :amn_dorpeito,          :boolean
  	add_column :evaluations, :amn_dorpeitoultimomes, :boolean
  	add_column :evaluations, :amn_desmaio,           :boolean
  	add_column :evaluations, :amn_problemaosseo,     :boolean
  	add_column :evaluations, :amn_medicamentopressao,:boolean
  	add_column :evaluations, :amn_impedimento,       :boolean
  	add_column :evaluations, :amn_observacoes,       :string, limit: 300
  end
end