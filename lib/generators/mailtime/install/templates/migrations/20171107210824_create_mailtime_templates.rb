class CreateMailtimeTemplates < ActiveRecord::Migration
  def change
    create_table :mailtime_templates do |t|
      t.string :name
      t.text :content
      t.integer :layout_id
      t.timestamps null: false
    end

    add_index :mailtime_templates, :layout_id

  end
end
