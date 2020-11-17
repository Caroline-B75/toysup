class UpdateToys < ActiveRecord::Migration[6.0]
  def change
    remove_column :toys, :photo
  end
end
