require './bin/app.rb'
require 'test/unit'
require 'rack/test'

# App tests. Made some changes here as I amended the form
class MyAppTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    assert_equal 'Hello world', last_response.body
  end

  def test_hello_form
    get '/hello/'
    assert last_response.ok?
    assert last_response.body.include?('Greeting')
  end

  def test_hello_form_post
    post '/hello/', params = { name: 'Frank',
                               greeting: 'hi' }
    assert last_response.ok?
    assert last_response.body.include?('I just wanted to say')
  end
end