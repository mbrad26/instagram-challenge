require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User is not valid with the empty attributes' do
    user = User.create(full_name: nil, username: nil, email: nil, password: nil)

    expect(user).to_not be_valid
  end

  it "User's email is unique" do
    userOne = User.create(full_name: 'Marius Brad', username: 'mbrad26', email: 'email@example.com', password: 'password')
    userTwo = User.create(full_name: 'John Brad', username: 'jbrad26', email: 'email@example.com', password: 'password123')

    expect(userTwo).to_not be_valid
  end

  it "User's password must be at leats 6 characters long" do
    user = User.create(full_name: 'Marius Brad', username: 'mbrad26', email: 'email@example.com', password: 'pass')

    expect(user).to_not be_valid
  end

  it "User's email must be of correct format" do
    user = User.create(full_name: 'Marius Brad', username: 'mbrad26', email: 'email-example.com', password: 'password')

    expect(user).to_not be_valid
  end
end
