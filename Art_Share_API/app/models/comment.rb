class Comment < ApplicationRecord
    belongs_to :author,
        class_name: :User,
        foreign_key: :user_id,
        dependent: :destroy

    belongs_to :artwork,
        class_name: :Artwork,
        foreign_key: :artwork_id,
        dependent: :destroy
end
