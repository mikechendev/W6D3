class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    has_many :artworks,
        foreign_key: :artist_id,
        class_name: :Artwork
    
    has_many :artwork_shares,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare

    has_many :shared_artworks,
        through: :artwork_shares,
        source: :artwork

    has_many :comments,
        foreign_key: :user_id,
        class_name: :Comment

    has_many :likes

    def self.search(search)
        if search
            @username = User.find_by(username: search)
            if @username
                self.where(id: @username)
            else
                @username.all
            end
        else
            @username.all
        end
    end

    def favorite_artworks
        self.artworks.where('artworks.favorite = True')
    end

    def favorite_shared_artworks
        self.artwork_shares.where('artwork_shares.favorite = True')
    end
end
