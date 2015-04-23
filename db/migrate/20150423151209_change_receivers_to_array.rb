class ChangeReceiversToArray < ActiveRecord::Migration
  def change
    add_column :kudos, :receivertmp, :integer, array:true, default: []
  end
end
