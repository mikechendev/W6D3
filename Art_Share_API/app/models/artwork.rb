class Artwork < ApplicationRecord
    validates :title, uniqueness: { scope: :artist_id, message: 'a single user cannot have the same artwork' }

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User,
        dependent: :destroy

    has_many :artwork_shares,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare
    
    has_many :shared_viewers,
        through: :artwork_shares,
        source: :viewer

    has_many :comments,
        foreign_key: :artwork_id,
        class_name: :Comment

    has_many :likes, as: :likeable
end
