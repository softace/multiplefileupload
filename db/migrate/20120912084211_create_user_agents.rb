class CreateUserAgents < ActiveRecord::Migration
  def change
    create_table :user_agents do |t|
      t.datetime :last_seen, :null => false
      t.string :user_agent_string, :null => false, :limit => 255, :unique => true
      t.integer :get_count, :null => false
      t.integer :post_zero_count, :null => false
      t.integer :post_single_count, :null => false
      t.integer :post_multiple_count, :null => false

      t.timestamps
    end
    add_index(:user_agents, :user_agent_string)
  end
end
