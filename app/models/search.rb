class Search < ApplicationRecord
  validates :query, presence: true, length:{ in: 4...50 }
  validates :session_id, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_query, against: :query
end