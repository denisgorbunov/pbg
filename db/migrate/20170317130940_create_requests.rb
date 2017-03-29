class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table  :requests do |t|
      t.belongs_to  :client, index: true
      t.belongs_to  :user, index: true
      t.boolean     :template
      t.integer     :bg_type
      t.integer     :issue, limit: 20
      t.integer     :bg_summ
      t.string      :summ_currency
      t.boolean     :immediately
      t.date        :date_end
      t.boolean     :prepayment
      t.text        :comment
      t.integer     :status
      t.integer     :approval

      t.timestamps
    end
  end
end
