class RemoveKudotypeIndex < ActiveRecord::Migration
  def change
    remove_index(:kudos, :name => 'index_kudos_on_kudotype_id')
  end
end
