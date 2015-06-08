class AddTagableToTags < ActiveRecord::Migration
  def change
  	add_reference :tags, :tagable, polymorphic: true, index: true
  end
end
