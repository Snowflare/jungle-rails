require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'should pass validation with required inputs' do
      @user = User.new(name: 'Daniel Joestar', email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user.valid?
      expect(@user.errors).to_not include ("can't be blank")
    end
    it 'should not pass validation with different password' do
      @user = User.new(name: 'Daniel Joestar', email: 'google@mail.com', password: '123456', password_confirmation: '12345')
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include ("doesn't match Password")
    end
    it 'should not pass validation without password' do
      @user = User.new(name: 'Daniel Joestar', email: 'google@mail.com', password: nil, password_confirmation: '12345')
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password can't be blank")
    end
    it 'should not pass validation without password_confirmation' do
      @user = User.new(name: 'Daniel Joestar', email: 'google@mail.com', password: '123456', password_confirmation: nil)
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation can't be blank")
    end
    it 'should not pass validation without name' do
      @user = User.new(name: nil, email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name can't be blank")
    end
    it 'should not pass validation without email' do
      @user = User.new(name: 'Daniel Joestar', email: nil, password: '123456', password_confirmation: '123456')
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
    end
    it 'should not pass validation with existed email' do
      @user = User.new(name: 'Daniel Joestar', email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user.save
      @user_copy = User.new(name: 'Daniel Silenthill', email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user_copy.valid?
      expect(@user_copy.errors.full_messages).to include ("Email has already been taken")
    end
    it 'should not pass validation with short password' do
      @user = User.new(name: 'Daniel Joestar', email: 'google@mail.com', password: '1234', password_confirmation: '1234')
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password is too short (minimum is 5 characters)")
    end
  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'should return the user with correct password' do
      @user = User.new(name: 'Daniel', email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user.save
      @email = 'google@mail.com'
      @password = '123456'
      @authenticated = User.authenticate_with_credentials(@email, @password)
      
      expect(@authenticated.email).to eq(@email)
      expect(@authenticated.password_digest).to_not eq(@password)
    end
    it 'should return false with incorrect password' do
      @user = User.new(name: 'Daniel', email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user.save
      @email = 'google@mail.com'
      @password = '123'
      @authenticated = User.authenticate_with_credentials(@email, @password)      
      
      expect(@authenticated).to eq(false)
    end
    it 'should return the user with correct password and upper-case email address' do
      @user = User.new(name: 'Daniel', email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user.save
      @email = 'Google@mail.com'
      @password = '123456'
      @authenticated = User.authenticate_with_credentials(@email, @password)
      
      expect(@authenticated.email).to eq(@email)
      expect(@authenticated.password_digest).to_not eq(@password)
    end
    it 'should return the user with correct password and email address with space' do
      @user = User.new(name: 'Daniel', email: 'google@mail.com', password: '123456', password_confirmation: '123456')
      @user.save
      @email = ' google@mail.com   '
      @password = '123456'
      @authenticated = User.authenticate_with_credentials(@email, @password)
      
      expect(@authenticated.email).to eq(@email)
      expect(@authenticated.password_digest).to_not eq(@password)
    end
    
  end
  
end
