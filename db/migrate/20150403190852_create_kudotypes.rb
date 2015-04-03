class CreateKudotypes < ActiveRecord::Migration
  def change
    create_table :kudotypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
