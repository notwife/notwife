class FixUsersColumns < ActiveRecord::Migration
  def self.up
    rename_column :users, :screen_name, :twitter_screen_name
    add_column    :users, :twitter_id,      :integer
    add_column    :users, :notifo_username, :string

    add_index :users, :twitter_id
    add_index :users, :twitter_screen_name
  end

  def self.down
    rename_column :users, :twitter_screen_name, :screen_name
    remove_column :users, :twitter_id
    remove_column :users, :notifo_username
  end
end
