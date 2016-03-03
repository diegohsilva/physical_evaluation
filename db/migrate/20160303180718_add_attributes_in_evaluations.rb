class AddAttributesInEvaluations < ActiveRecord::Migration
  def change
 	add_column :evaluations, :Ccorp_Jackson7,      :boolean
  	add_column :evaluations, :Ccorp_Jackson3,      :boolean
  	add_column :evaluations, :Ccorp_bioimpedancia, :boolean
  	add_column :evaluations, :Ccorp_peso,          :float
  	add_column :evaluations, :Ccorp_altura,        :float
  	add_column :evaluations, :Ccorp_gordura,       :float
  	add_column :evaluations, :Ccorp_subescapular,  :float
  	add_column :evaluations, :Ccorp_tricipital,    :float
  	add_column :evaluations, :Ccorp_coxa,          :float
  	add_column :evaluations, :Ccorp_peitoral,      :float
  	add_column :evaluations, :Ccorp_supraIliaca,   :float
  	add_column :evaluations, :Ccorp_AxilarMedia,   :float
  end
end
