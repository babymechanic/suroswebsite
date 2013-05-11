class CreateArtworksArtworks < ActiveRecord::Migration

  def up
    create_table :refinery_artworks do |t|
      t.string :name
      t.integer :thumbnail_id
      t.text :description
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-artworks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/artworks/artworks"})
    end

    drop_table :refinery_artworks

  end

end
