class CreateRequestItems < ActiveRecord::Migration[5.1]
  def change
    create_table :request_items do |t|
      t.string :trap_id
      t.datetime :r_date
      t.string :r_data
    end
  end
end
