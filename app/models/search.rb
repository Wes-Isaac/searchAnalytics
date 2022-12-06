class Search < ApplicationRecord
  validates :query, presence: true, length:{ in: 4...50 }
  validates :session_id, presence: true

  def isPresent?(key)
    jarow = FuzzyStringMatch::JaroWinkler.create(:native)
    similarity_percentage = jarow.getDistance(key, query)
    similarity_percentage > 0.8
  end
end