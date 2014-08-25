class LinkTrack < ActiveRecord::Base
	belongs_to :user
	belongs_to :link

	scope :distinct_user_link_tracks, -> { select("distinct user_id, link_id").includes(:user, :link) }
end