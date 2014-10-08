class AddflagCountToPosts < ActiveRecord::Migration
  def change
      # add_column table_name, :column_name, :column_type
    add_column :posts, :flag_count, :integer ,:default =>0
  end
end
