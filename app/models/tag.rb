class Tag < ::ApplicationRecord
  has_and_belongs_to_many :recipes
  scope :ordered, -> { order(title: :asc) }
end
