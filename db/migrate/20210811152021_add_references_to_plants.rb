class AddReferencesToPlants < ActiveRecord::Migration[6.0]
  def change
    add_reference :plants, :park, null: false, foreign_key: true
  end
end
