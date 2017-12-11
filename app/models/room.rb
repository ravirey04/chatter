class Room < ApplicationRecord
	extend FriendlyId
	friendly_id :roomname, use: :slugged
end
