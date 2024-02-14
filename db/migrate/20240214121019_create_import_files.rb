class CreateImportFiles < ActiveRecord::Migration[7.0]
  def change
    create_table :import_files do |t|
      t.string :file
      t.integer :import_file_type
      t.timestamps
    end
  end
end
