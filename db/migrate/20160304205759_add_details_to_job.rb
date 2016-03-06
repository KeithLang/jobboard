class AddDetailsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :details, :string
  end
end
