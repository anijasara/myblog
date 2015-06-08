class Post < ActiveRecord::Base
	has_many :comments
	has_many :tags_posts
	has_many :tags, through: :tags_posts

	belongs_to :user, :foreign_key => :created_by ,:class_name =>"User"

	validates_presence_of :title, :description
	validates_uniqueness_of :title

	def to_param
     "#{id}-#{title.parameterize}"
  end

  def self.tagged_with(name)
  	Tag.find_by_name!(name).posts
	end

  def all_tags=(names)
  	self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
  	end
	end
 
	def all_tags
  	self.tags.map(&:name).join(", ")
	end
end
