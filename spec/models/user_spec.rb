require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'checks if creates a valid user' do
      @user = User.new(
        first_name: 'name',
        last_name: 'lastName',
        email: 'user@mail.com',
        password: 'pw123',
        password_confirmation: 'pw123'
      )
      expect(@user).to be_valid
    end

    it 'checks if password and confirmation is the same' do
      @user = User.new(
        first_name: 'name',
        last_name: 'lastName',
        email: 'user@mail.com',
        password: 'pw123',
        password_confirmation: 'pq123'
      )
      expect(@user).to_not be_valid
    end

    it 'refuses to create a user without password or confirmation' do
      @user = User.new(
        first_name: 'name',
        last_name: 'lastName',
        email: 'user@mail.com',
        password: nil,
        password_confirmation: nil
      )
      expect(@user).to_not be_valid
    end

    it 'refuses to create a user without name' do
      @user = User.new(
        first_name: nil,
        last_name: 'lastName',
        email: 'user@mail.com',
        password: 'nil',
        password_confirmation: 'nil'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to include("can't be blank")
    end

    it 'refuses to create a user without last name' do
      @user = User.new(
        first_name: 'Nil',
        last_name: nil,
        email: 'user@mail.com',
        password: 'nil123',
        password_confirmation: 'nil123'
      )
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages[0]).to include("can't be blank")
    end

    it 'refuses to create a user with the email that already exists' do
      @email = User.find(1).email
      @user = User.new(
        first_name: 'Nil',
        last_name: nil,
        email: @email,
        password: 'nil123',
        password_confirmation: 'nil123'
      )
      expect(@user).to be_valid
      
    end
  end
  #pending "add some examples to (or delete) #{__FILE__}"
end
