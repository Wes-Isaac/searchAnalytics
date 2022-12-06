require 'capybara/rspec'
require 'rails_helper'

# RSpec.describe Book, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe 'Books', type: :feature do
  title = Faker::Book.title[5..10]
  description= Faker::Lorem.paragraph(sentence_count: 5)
  long_text = Faker::Lorem.paragraph(sentence_count:120)

  it 'is valid when all fields are present' do
    book = Book.new(title: title, description: description)
    expect(book).to be_valid
  end

  it 'is not valid if title is less than 5 characters' do
    book = Book.new(title: "te", description: description)
    expect(book).to_not be_valid
  end
  it 'is not valid when title is not present' do
    book = Book.new(description: description)
    expect(book).to_not be_valid
  end

  it 'is not valid when description is not present' do
    book = Book.new(title: title)
    expect(book).to_not be_valid
  end

  it 'is not valid when description is less than 15 characters' do
    book = Book.new(title: title, description: 'not valid')
    expect(book).to_not be_valid
  end

  it 'is not valid if title is more than 50' do
    book = Book.new(title: long_text, description: description)
    expect(book).to_not be_valid
  end

  it 'is not valid if desecription is more than 250' do
    book = Book.new(title: title, description: long_text)
    expect(book).to_not be_valid
  end


end