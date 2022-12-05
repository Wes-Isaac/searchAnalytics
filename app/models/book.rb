class Book < ApplicationRecord
  validates :title, presence: true, length:{minimum: 4, maximum: 50}
  validates :description, presence: true, length:{minimum:15, maximum: 250}

  include PgSearch::Model
  pg_search_scope :search_by_title, against: :title
  # multisearchable against: :title
end
