class Tag < ActiveRecord::Base
	has_many :tags_posts
	has_many :posts, through: :tags_posts

	def self.counts
  		self.select("name, count(tags_posts.tag_id) as count").joins(:tags_posts).group("tags.name")
	end
end
