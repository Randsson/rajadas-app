class CreateCodigos < ActiveRecord::Migration[5.2]
  def change
    create_table :codigos do |t|
      t.string :codigo

      t.timestamps
    end
  end
end
