class AddAvaliacaoPosturalInEvaluation < ActiveRecord::Migration
  def change
  	add_column :evaluations, :photo_lateral_direita,     :string
  	add_column :evaluations, :photo_lateral_esquerda,    :string
  	add_column :evaluations, :photo_posterior,           :string
  	add_column :evaluations, :photo_anterior,            :string
  	add_column :evaluations, :anterversao_de_quadril,    :boolean
  	add_column :evaluations, :retroversao_de_quadril,    :boolean
  	add_column :evaluations, :rotacao_interna_ombros,    :boolean
  	add_column :evaluations, :retificacao_cervical,      :boolean
  	add_column :evaluations, :retificacao_lombar,        :boolean
  	add_column :evaluations, :protusao_abdominal,        :boolean
  	add_column :evaluations, :hiperlordose_cervical,     :boolean
  	add_column :evaluations, :hiperlordose_lombar,       :boolean
  	add_column :evaluations, :hipercifose_toracica,      :boolean
  	add_column :evaluations, :pe_plano,                  :boolean
  	add_column :evaluations, :pe_cavo,                   :boolean
  	add_column :evaluations, :pe_calcaneo,               :boolean
  	add_column :evaluations, :pe_equino,                 :boolean
  	add_column :evaluations, :genu_flexo,                :boolean
  	add_column :evaluations, :genu_recurvado,            :boolean
  	add_column :evaluations, :escoliose_cervical,        :boolean
  	add_column :evaluations, :escoliose_toracica,        :boolean
  	add_column :evaluations, :escoliose_lombar,          :boolean
  	add_column :evaluations, :protacao_escapular,        :boolean
  	add_column :evaluations, :retracao_escapular,        :boolean
  	add_column :evaluations, :depressao_escapular,       :boolean
  	add_column :evaluations, :pe_vago,                   :boolean
  	add_column :evaluations, :pe_varo,                   :boolean
  	add_column :evaluations, :encurtamento_de_trapezio,  :boolean
  	add_column :evaluations, :genu_valgo,                :boolean
  	add_column :evaluations, :genu_varo,                 :boolean
  	add_column :evaluations, :pe_aduto,                  :boolean
  	add_column :evaluations, :pe_abduto,                 :boolean
  	add_column :evaluations, :ombros_assimetricos,       :integer
  	add_column :evaluations, :assimetria_quadril,        :integer
  	add_column :evaluations, :observacoes ,              :string
  end
end
