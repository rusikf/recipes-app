class Profile < ::ApplicationRecord
  has_many :recipes, foreign_key: :author_id
end
