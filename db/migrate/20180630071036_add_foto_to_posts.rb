class AddFotoToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :foto, :string
  end
end
