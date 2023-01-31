require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'generates the correct error message when password is blank' do
      @user = User.create(email: 'lana@lana.com', first_name: 'Lana', last_name: 'Del Rey', password: nil,
                          password_confirmation: '123')
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'generates the correct error message when password_confirmation is blank' do
      @user = User.create(email: 'lana@lana.com', first_name: 'Lana', last_name: 'Del Rey', password: '123',
                          password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'generates the correct error message when password and password_confirmation do not match' do
      @user = User.create(email: 'lana@lana.com', first_name: 'Lana', last_name: 'Del Rey', password: '12',
                          password_confirmation: '123')
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'generates the correct error message when email is empty' do
      @user = User.create(email: nil, first_name: 'Lana', last_name: 'Del Rey', password: '123',
                          password_confirmation: '123')
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'generates the correct error message when first_name is blank' do
      @user = User.create(email: 'lana@lana.com', first_name: nil, last_name: 'Del Rey', password: '123',
                          password_confirmation: '123')
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'generates the correct error message when last name is empty' do
      @user = User.create(email: 'lana@lana.com', first_name: 'Lana', last_name: nil, password: '123',
                          password_confirmation: '123')
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'generates the correct error message when email is not unique' do
      @user1 = User.create(email: 'lana@lana.com', first_name: 'Lana', last_name: 'Del Rey', password: '123',
                           password_confirmation: '123')
      @user2 = User.create(email: 'lana@lana.com', first_name: 'Lana', last_name: 'Del Rey', password: '123',
                           password_confirmation: '123')
      expect(@user2.errors.full_messages).to include('Email has already been taken')
    end
    it 'generates the correct error message when password is too short' do
      @user = User.create(email: 'lana@lana.com', first_name: 'Lana', last_name: 'Del Rey', password: '12',
                          password_confirmation: '12')
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 3 characters)')
    end
  end
end
