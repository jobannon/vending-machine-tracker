class AddKindToSnacks < ActiveRecord::Migration[5.1]
  def change
    add_column :snacks, :kind, :string
  end
end
