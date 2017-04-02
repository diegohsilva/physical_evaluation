class AddCrefitoToEvaluators < ActiveRecord::Migration
  def change
    add_column :evaluators, :crefito, :string
  end
end
