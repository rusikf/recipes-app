class Recipe < ::ApplicationRecord
  has_and_belongs_to_many :tags
  belongs_to :author, class_name: 'Profile'
end
