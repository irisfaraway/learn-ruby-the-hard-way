require './bin/app.rb'
require 'test/unit'
require 'rack/test'

# App tests. Made some changes here as I amended the form
class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_game_form
    get '/game'
    assert last_response.ok?
    assert last_response.body.include?('You died!')
  end

  def test_hello_form_post
    post '/game', params = { action: 'whatever' }
    assert last_response.ok?
    assert last_response.body.include?('You died!')
  end
end
