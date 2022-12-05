class Search < ApplicationRecord
  validate :query, presence :true, length:{minimum: 4, maximum,50}
end