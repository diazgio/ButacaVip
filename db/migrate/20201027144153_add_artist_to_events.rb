class AddArtistToEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :artist, :string
  end
end
