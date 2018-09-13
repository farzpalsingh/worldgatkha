class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|

    	t.string   :title
    	t.text     :description
    	t.datetime :datetime
    	t.string   :video_url
    	
      t.timestamps
    end
  end
end
