class Search < ApplicationRecord
  validates :query, presence: true, length:{minimum: 4, maximum,50}
end