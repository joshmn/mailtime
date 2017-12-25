class CreateMailtimeTables < ActiveRecord::Migration
  def change
    create_table :mailtime_logs do |t|
      t.integer :thing_id
      t.string :thing_type
      t.string :mailer_class
      t.string :mailer_method

      t.timestamps null: false
    end
    add_index :mailtime_logs, [:thing_id, :thing_type]
    add_index :mailtime_logs, :mailer_class
    add_index :mailtime_logs, :mailer_method

    create_table :mailtime_templates do |t|
      t.string :name
      t.string :klass
      t.string :action
      t.text :content
      t.integer :layout_id
      t.timestamps null: false
    end

    add_index :mailtime_templates, :layout_id
    add_index :mailtime_templates, [:klass, :action]


    create_table :mailtime_layouts do |t|
      t.string :name
      t.text :content

      t.timestamps null: false
    end

  end
end