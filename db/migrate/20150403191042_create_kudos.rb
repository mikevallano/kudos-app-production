class CreateKudos < ActiveRecord::Migration
  def change
    create_table :kudos do |t|
      t.references :kudotype, index: true
      t.integer :giver_id
      t.integer :receiver_id
      t.text :comments

      t.timestamps null: false
    end
    add_foreign_key :kudos, :kudotypes
  end
end
