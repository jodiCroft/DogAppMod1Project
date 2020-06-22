class CreateBreeds < ActiveRecord::Migration[6.0]
  def change 
    create_table :breeds do |t|
      t.string :name
      t.string :temperament
      t.string :life_span
    end
  end
end
