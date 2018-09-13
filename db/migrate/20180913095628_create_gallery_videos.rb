class CreateGalleryVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :gallery_videos do |t|

    	t.string   :title
    	t.string   :video_url

      t.timestamps
    end
  end
end
