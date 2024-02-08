class CreateGossipsTags < ActiveRecord::Migration[7.1]
  def change
    create_table :gossips_tags, id: false do |t|
      t.references :gossip, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
