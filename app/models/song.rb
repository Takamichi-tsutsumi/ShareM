class Song < ActiveRecord::Base
	belongs_to :user
	validates :user_id, presence: true
	validates :title, presence: true, length: { maximum: 144 }
	validates :upload_file, presence: true
end
