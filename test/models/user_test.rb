require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @batman = User.new(username: "batman",
                     token: "the_dark_knight",
                     secret: "bruce_wayne",
                     bio: "My parents are deeeaaaadddddd.")
    @robin = User.new(username: "robin")
  end

  test "should be valid" do
    assert @batman.valid?
  end

  test "token, secret, and bio are not required" do
    assert @robin.valid?
  end

  test "username is required" do
    assert_not User.new().valid?
  end

  test "username is not blank" do
    assert_not User.new(username: "").valid?
    assert_not User.new(username: "   ").valid?
  end

  test "username must be unique" do
    assert User.new(username: 'batman').valid?
  end

  test "token and secret are unique if not null" do
    assert User.new(username: "zatana").valid?

    cbale = User.new(username: "christian_bale", token: "the_dark_knight")
    assert_not cbale.valid?

    insider = User.new(username: "insider", secret: "bruce_wayne")
    assert_not insider.valid?

    superman = User.new(username: "superman",
                        token: "man_of_steel",
                        secret: "clark_kent",
                        bio: "My parents are deeeaaaadddddd.")
    assert superman.valid?
  end

  test "bio defaults to empty string" do
    assert @robin.bio == ""
  end
end
