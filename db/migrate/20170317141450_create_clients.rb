class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table  :clients do |t|
      t.belongs_to  :user
      t.string      :name
      t.integer     :inn, index: true
      t.integer     :kpp

      t.timestamps
    end
  end
end
