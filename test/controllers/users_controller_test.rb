require 'test_helper'
require "minitest/autorun"
require "minitest/pride"


class UsersControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers
    test "should get index and list chefs" do
      get :index
      assert_response :success
      assert_match users(:one).name, @response.body
    end
    
    test "should show logout to signed in user" do
      sign_in users(:one)
      get :index
      assert_match 'Logout', @response.body
    end

    test "should show `Chef Login` to unsigned in user" do
      get :index
      assert_match 'Login', @response.body
    end

    test "a signed in user should be able to visit their edit profile page" do
      sign_in users(:one)
      get :edit, params: {id: users(:one).id}
      assert_response :success
      assert_match 'Update', @response.body
    end

    test "should display user profile" do
      user = User.create!({email: 'gordonramsey@gmail.com', password: 'pass123', name: 'Gordon Ramsey', location_lat: 51.512640,location_lon: -0.090390, bio: 'Swears a lot and has numerous TV shows in both UK and America'})
      get :show, params: { id: user.id }
      assert_response :success
      assert_match user.bio, @response.body
    end

    test "should filter users that don't have a given name" do
      get :index, params: { name: "Bella" }
      assert_response :success
      assert_match 'Bella', @response.body
    end

    test "the search function should not be case sensitive" do
      get :index, params: { name: "bella" }
      assert_response :success
      assert_match 'Bella', @response.body
    end

    test "the search function should not need the name field to be added in full" do
      get :index, params: { name: "bell" }
      assert_response :success
      assert_match 'Bella', @response.body
    end

    test "the search function should be able to filter chefs by skills" do
      get :index, params: { skills: {ids: ['',skills(:one).id.to_s] }}
      assert_response :success
      assert_match 'Bella', @response.body
    end

    test "the search function should not show users who do not have a searched for skill" do
      get :index, params: { skills: {ids: ['',skills(:one).id.to_s] }}
      assert_response :success
      refute_match 'My name is Mr Chef', @response.body
    end

    test "I should be able to filter the users by a location they are willing to travel to" do
      get :index, params: { location: 'Oxford' }
      assert_match 'Bella', @response.body
    end

    test "I should be able to filter the users by a location they are unwilling to travel to" do
      get :index, params: { location: 'Newcastle Upon Tyne' }
      refute_match 'Bella', @response.body
    end

    test "a user should be able to edit their own name" do
      sign_in users(:one)
      put :update, params: {id: users(:one).id, user: {"name"=>"Bella Name Change", "email"=>"zoe@wegotcoders.com", "bio"=>"Probably loves the flash more than she loves cooking but makes a mean brownie", "distance_to_travel"=>"50", "location_lat"=>"51.755733", "location_lon"=>"-0.010177"}}
      get :show, params: {id: users(:one).id}
      assert_match 'Bella Name Change', @response.body
    end


  end
