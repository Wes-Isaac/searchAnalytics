class Search < ApplicationRecord
  validates :query, presence: true, length:{ in: 4...50 }
  validates :session_id, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_query, against: :query

  def exists?(key)
    jarow = FuzzyStringMatch::JaroWinkler.create(:native)
    similarity_percentage = jarow.getDistance(key, query)
    similarity_percentage > 0.8
  end
end