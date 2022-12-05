class Book < ApplicationRecord
  validate :title, presence :true, length:{minimum: 4, maximum: 50}
  validate :description, presence :true, length: {minimum:15, maximum: 250}
end
