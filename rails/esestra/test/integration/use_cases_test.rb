require 'test_helper'

class UseCasesTest < ActionDispatch::IntegrationTest

  test 'register specialty - insert specialty' do
    post '/specialties', specialty: {name: 'Interna'}
    assert_response :success
    assert Specialty.find_by_name('Interna')
  end

  test 'list surgeries' do
    get '/surgeries'
    assert_response :success
  end
end
