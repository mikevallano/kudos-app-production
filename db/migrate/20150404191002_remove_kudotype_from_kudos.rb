class RemoveKudotypeFromKudos < ActiveRecord::Migration
  def change
    remove_column :kudos, :kudotype_id
  end
end
