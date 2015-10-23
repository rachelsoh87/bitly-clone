class CreateUrls < ActiveRecord::Migration
	def change
		create_table :urls do |t|
			t.string :longer_url
			t.string :shortened_url
			t.integer :click_count, default: 0, null: false
		end			
	end
end
