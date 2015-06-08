class CreateTagsPosts < ActiveRecord::Migration
  def change
    create_table :tags_posts do |t|
      t.belongs_to :post, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
