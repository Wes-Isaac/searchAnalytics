require 'capybara/rspec'
require 'rails_helper'

describe 'Searches',type: :feature do

  long_text = Faker::Lorem.paragraph(sentence_count:120)
  session_id = SecureRandom.urlsafe_base64(16)

  it 'is valid when all fields are present' do
    search = Search.new(query: 'query', session_id: session_id)
    expect(search).to be_valid
  end

  it 'is not valid without session_id' do
    search = Search.new(query: 'query')
    expect(search).to_not be_valid
  end

  it 'is not valid if query is less than 4 characters' do
    search = Search.new(query: 'qu', session_id: session_id)
    expect(search).to_not be_valid
  end

  
  it 'is not valid when query is not present' do
    search = Search.new(session_id: session_id)
    expect(search).to_not be_valid
  end
  it 'is not valid if query is more than 50 characters' do
    search = Search.new(query: long_text, session_id: session_id)
    expect(search).to_not be_valid
  end

end