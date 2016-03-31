class AddPerimetrosInEvaluation < ActiveRecord::Migration
  def change
  	add_column :evaluations, :antebraco_direito,         :float
  	add_column :evaluations, :antebraco_esquerdo,        :float
    add_column :evaluations, :braco_relaxado_direito,    :float
  	add_column :evaluations, :braco_relaxado_esquerdo,   :float 
    add_column :evaluations, :braco_contraido_direito,   :float
  	add_column :evaluations, :braco_contraiddo_esquerdo, :float 
  	add_column :evaluations, :coxa_proximal_direito,     :float
  	add_column :evaluations, :coxa_proximal_esquerdo,    :float
    add_column :evaluations, :coxa_medial_direito,       :float
  	add_column :evaluations, :coxa_medial_esquerdo,      :float 
    add_column :evaluations, :coxa_distal_direito,       :float
  	add_column :evaluations, :coxa_distal_esquerdo,      :float 
    add_column :evaluations, :panturrilha_direito,       :float
  	add_column :evaluations, :panturrilha_esquerdo,      :float 
  	add_column :evaluations, :abdomen,                   :float
  	add_column :evaluations, :quadril,                   :float
    add_column :evaluations, :cintura,                   :float
  	add_column :evaluations, :torax,                     :float 
    add_column :evaluations, :ombro,                     :float
  	add_column :evaluations, :pescoco,                   :float 
  	add_column :evaluations, :punho,                     :float
  	add_column :evaluations, :umero,                     :float
    add_column :evaluations, :femur,                     :float
  end
end
