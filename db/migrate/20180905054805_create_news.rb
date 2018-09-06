class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|

    	t.string   :title
    	t.text     :description
    	t.datetime :datetime
    	t.boolean  :is_active, default: true

      	t.timestamps
    end
  end
end
