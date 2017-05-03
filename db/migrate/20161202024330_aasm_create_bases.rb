class AASMCreateBases < ActiveRecord::Migration
  def change
    create_table(:bases) do |t|
      t.string :aasm_state
      t.timestamps null: false 
    end
  end
end
