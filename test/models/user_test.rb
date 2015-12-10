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
    assert @batman.valid?, 'basic batman user expected to be valid'
  end

  test "token, secret, and bio are not required" do
    assert @robin.valid?, 'minimal robin user expected to be valid'
  end

  test "username is required" do
    assert_not User.new().valid?, "username-less user expected to be invalid"
  end

  test "username is not blank" do
    assert_not User.new(username: "").valid?,
      "blank username expected to be invalid"
    assert_not User.new(username: "   ").valid?,
      "whitespace-only username expected to be invalid"
  end

  test "username must be unique" do
    assert_not User.new(username: 'batman').valid?,
      "non-unique username expected to be invalid"
  end

  test "token and secret are unique if not null" do
    assert User.new(username: "zatana").valid?,
      "null token and secret expected to be valid, even when others are null"

    cbale = User.new(username: "christian_bale", token: "the_dark_knight")
    assert_not cbale.valid?, "non-unique token expected to be invalid"

    insider = User.new(username: "insider", secret: "bruce_wayne")
    assert_not insider.valid?, "non-unique secret expected to be invalid"

    superman = User.new(username: "superman",
                        token: "man_of_steel",
                        secret: "clark_kent",
                        bio: "My parents are deeeaaaadddddd.")
    assert superman.valid?, "non-unique bio expected to be valid"
  end

  test "bio defaults to empty string" do
    assert @robin.bio == "", "unspecified bio expected to be empty string"
  end

  test "non-bio fields are capped at 63 characters" do
    too_long = 'x' * 64
    long_username = User.new(username: too_long)
    assert_not long_username.valid?, "too-long username expected to be invalid"

    long_token = User.new(username: "long_token",
                          token: too_long)
    assert_not long_token.valid?, "too-long token expected to be invalid"

    long_secret = User.new(username: "long_secret",
                           secret: too_long)
    assert_not long_secret.valid?, "too-long secret expected to be invalid"

    long_bio = User.new(username: "long_bio",
                        bio: too_long)
    assert long_bio.valid?, "long bio expected to be valid"
  end

  test "bio is capped at 255 characters" do
    darkseid = User.new(username: 'darkseid',
                        bio: 'x' * 256)
    assert_not darkseid.valid?, "too-long bio expected to be invalid"
  end
end
