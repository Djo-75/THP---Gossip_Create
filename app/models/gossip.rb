class Gossip < ApplicationRecord
    validates :title, presence: true # rend la présence du titre obligatoire
    validates :title, length: { in: 3..3003 }
    validates :content, presence: true

    belongs_to :user, required: false
    belongs_to :tag_gossip, required: false
    has_many :tags, through: :tag_gossips
    has_many :comments
end
