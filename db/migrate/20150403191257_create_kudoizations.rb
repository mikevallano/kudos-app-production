class CreateKudoizations < ActiveRecord::Migration
  def change
    create_table :kudoizations do |t|
      t.references :kudo, index: true
      t.references :kudotype, index: true

      t.timestamps null: false
    end
    add_foreign_key :kudoizations, :kudos
    add_foreign_key :kudoizations, :kudotypes
  end
end
