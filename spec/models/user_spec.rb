require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "should pass if all fields are present" do
      user = User.create(
        first_name: "derrell",
        last_name: 'wong',
        email: 'dw@gmail.com',
        password: '123456',
        password_confirmation: '123456'
        )
      user.save!
      expect(user).to be_valid
    end

    it "should fail if all password and confirmation do not match" do
      user = User.create(
        first_name: "derrell",
        last_name: 'wong',
        email: 'dw@gmail.com',
        password: 'abcdef',
        password_confirmation: '123456'
        )
      expect(user.errors.has_key?(:password_confirmation)).to be_truthy
    end

    it "should fail password is less than 6 characters" do
      user = User.create(
        first_name: "derrell",
        last_name: 'wong',
        email: 'dw@gmail.com',
        password: 'abc',
        password_confirmation: 'abc'
        )
      expect(user.errors.has_key?(:password)).to be_truthy
    end


    it 'should check error if email is not unique and case sensitive' do
     user1 = User.create!(
        first_name: 'first',
        last_name: 'last',
        email: 'current@user.com',
        password: 'qwerty',
        password_confirmation: 'qwerty'
        )

     user2 = User.create(
        first_name: 'next',
        last_name: 'user',
        email: 'CURRENT@USER.com',
        password: 'qwer12',
        password_confirmation: 'qwer12'
        )
     expect(user2.errors.has_key?(:email)).to be_truthy
   end


  end
end




