class RemoveReceiverIdFromKudos < ActiveRecord::Migration
  def change
    remove_column :kudos, :receiver_id
  end
end
