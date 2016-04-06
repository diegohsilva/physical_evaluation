class AddAttributesInEvaluations < ActiveRecord::Migration
  def change
 	add_column :evaluations, :ccorp_jackson7,      :boolean
  	add_column :evaluations, :ccorp_jackson3,      :boolean
  	add_column :evaluations, :ccorp_bioimpedancia, :boolean
  	add_column :evaluations, :ccorp_peso,          :float
  	add_column :evaluations, :ccorp_altura,        :float
  	add_column :evaluations, :ccorp_gordura,       :float
  	add_column :evaluations, :ccorp_subescapular,  :float
  	add_column :evaluations, :ccorp_tricipital,    :float
  	add_column :evaluations, :ccorp_coxa,          :float
  	add_column :evaluations, :ccorp_peitoral,      :float
  	add_column :evaluations, :ccorp_supraIliaca,   :float
  	add_column :evaluations, :ccorp_axilarmedia,   :float
  end
end
