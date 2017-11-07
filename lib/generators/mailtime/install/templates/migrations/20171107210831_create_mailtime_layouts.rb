class CreateMailtimeLayouts < ActiveRecord::Migration
  def change
    create_table :mailtime_layouts do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end
  end
end
