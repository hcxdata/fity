class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :words

      t.timestamps null: false
    end
  end
end
