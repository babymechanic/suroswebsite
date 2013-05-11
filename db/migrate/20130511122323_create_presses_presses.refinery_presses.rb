# This migration comes from refinery_presses (originally 1)
class CreatePressesPresses < ActiveRecord::Migration

  def up
    create_table :refinery_presses do |t|
      t.string :name
      t.integer :thumbnail_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-presses"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/presses/presses"})
    end

    drop_table :refinery_presses

  end

end
