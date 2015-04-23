class RenameReceivertmpToReceiverId < ActiveRecord::Migration
  def change
    rename_column :kudos, :receivertmp, :receiver_id
  end
end
