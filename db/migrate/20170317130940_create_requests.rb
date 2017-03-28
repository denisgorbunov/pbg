class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table  :requests do |t|
      t.belongs_to  :client, index: true
      t.belongs_to  :user, index: true
      t.boolean     :template
      t.integer     :type
      t.integer     :bg_summ
      t.integer     :summ_currency
      t.boolean     :immediately
      t.date        :date_end
      t.boolean     :prepayment

      t.timestamps
    end
  end
end
