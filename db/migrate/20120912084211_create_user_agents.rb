class CreateUserAgents < ActiveRecord::Migration
  def change
    create_table :user_agents do |t|
      t.datetime :last_seen
      t.string :user_agent_string, :limit => 255, :unique => true
      t.integer :get_count
      t.integer :post_zero_count
      t.integer :post_single_count
      t.integer :post_multiple_count

      t.timestamps
    end
    add_index(:user_agents, :user_agent_string)
  end
end
