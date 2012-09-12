class CreateUserAgents < ActiveRecord::Migration
  def change
    create_table :user_agents do |t|
      t.datetime :last_seen
      t.string :user_agent_string
      t.integer :get
      t.integer :post_zero
      t.integer :post_single
      t.integer :post_multiple

      t.timestamps
    end
  end
end
