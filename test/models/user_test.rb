require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def add_password(user_hash)
    {
      password: 'password',
      password_confirmation: 'password'
    }.merge(user_hash)
  end

  def setup
    @batman = User.new(username: "batman",
                       password: "batmobile",
                       password_confirmation: "batmobile",
                       token: "the_dark_knight",
                       secret: "bruce_wayne",
                       bio: "My parents are deeeaaaadddddd.")
    @robin = User.new(username: "robin",
                      password: "boywonder",
                      password_confirmation: "boywonder")
    @batman.save
    @robin.save
  end

  test "should be valid" do
    assert @batman.valid?, 'basic batman user expected to be valid'
  end

  test "token, secret, and bio are not required" do
    assert @robin.valid?, 'minimal robin user expected to be valid'
  end

  test "username is required" do
    noman = User.new(password: 'password',
                     password_confirmation: 'password')

    assert_not noman.valid?, "username-less user expected to be invalid"
  end

  test "username is not blank" do
    blanko = User.new(add_password(username: ''))
    assert_not blanko.valid?, "blank username expected to be invalid"
    blanka = User.new(add_password(username: '   '))
    assert_not blanka.valid?, "whitespace-only username expected to be invalid"
  end

  test "username must be unique" do
    assert_not User.new(add_password(username: 'batman')).valid?,
      "non-unique username expected to be invalid"
  end

  test 'username is normalized to lower case' do
    sut = User.create(add_password(username: 'ThePenguin'))

    assert sut.username == 'thepenguin',
      'mixed-case username expected to be normalized to lower case'
  end

  test "password must be present" do
    # TODO: figure out how to make a missing confirmation fail the validaton
    joker = User.new(username: 'joker', password_confirmation: 'hahahahaha')
    assert_not joker.valid?, 'missing password expected to be invalid'
  end

  test "password and confirmation must match" do
    swamp_thing = User.new(username: 'swamp_thing',
                           password: 'natureizcool',
                           password_confirmation: 'swampsrgr8')
    assert_not swamp_thing.valid?,
      'mismatched password and confirmation expected to be invalid'
  end

  test "bio defaults to empty string" do
    assert @robin.bio == "", "unspecified bio expected to be empty string"
  end

  test "non-bio fields are capped at 63 characters" do
    too_long = 'x' * 64
    long_username = User.new(add_password(username: too_long))
    assert_not long_username.valid?, "too-long username expected to be invalid"

    long_token = User.new(add_password(username: "long_token",
                          token: too_long))
    assert_not long_token.valid?, "too-long token expected to be invalid"

    long_secret = User.new(add_password(username: "long_secret",
                           secret: too_long))
    assert_not long_secret.valid?, "too-long secret expected to be invalid"

    long_bio = User.new(add_password(username: "long_bio",
                        bio: too_long))
    assert long_bio.valid?, "long bio expected to be valid"
  end

  test "bio is capped at 255 characters" do
    darkseid = User.new(add_password(username: 'darkseid',
                        bio: 'x' * 256))
    assert_not darkseid.valid?, "too-long bio expected to be invalid"
  end
end
