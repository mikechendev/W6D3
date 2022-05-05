class Like < ApplicationRecord
    validates :user, uniqueness: { scope: [:likeable_id, :likeable_type]}
    belongs_to :user, dependent: :destroy

    belongs_to :likeable, polymorphic: true
end
