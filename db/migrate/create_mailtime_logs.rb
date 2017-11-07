class CreateMailtimeLogs < ActiveRecord::Migration
  def change
    create_table :mailtime_logs do |t|
      t.integer :user_id
      t.string :mailer_class
      t.string :mailer_method

      t.timestamps null: false
    end
    add_index :mailtime_logs, :user_id
    add_index :mailtime_logs, :mailer_class
    add_index :mailtime_logs, :mailer_method
  end
end
