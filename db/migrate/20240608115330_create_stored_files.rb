class CreateStoredFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :stored_files do |t|
      t.string :name
      t.string :s3_key
      t.references :folder, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
