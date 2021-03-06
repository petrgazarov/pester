class CreateTagsHabtm < ActiveRecord::Migration
  def change
    create_table :pull_requests_tags do |t|
      t.belongs_to :pull_request
      t.belongs_to :tag
    end

    add_index :pull_requests_tags, [:pull_request_id, :tag_id], unique: true
  end
end
