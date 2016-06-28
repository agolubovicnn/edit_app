require 'spec_helper'

  describe User do

    it "is valid with a user_name, email, and password" do
      user = User.new(
        user_name: 'Tester',
        email: 'tester@test.com',
        password: 'testtest')
      expect(user).to be_valid
    end  

    it "is invalid without a user_name" do
      user = User.new(user_name: nil)
      expect(user).not_to be_valid
    end  

    it "is invalid without a email address" do
      user = User.new(email: nil)
      expect(user).not_to be_valid
    end 

    it "is invalid without an password" do
      user = User.new(password: nil)
      expect(user).not_to be_valid
    end  

    it "is invalid with a duplicate email address" do
      User.create(
      user_name: 'Tester',
      email: 'tester@test.com'
      )
      user = User.new(
      user_name: 'Testing',
      email: 'tester@test.com'
      )
      expect(user).not_to be_valid
    end  

    it "is invalid with bad email" do
      user = User.new
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end      
    end
      
  end

 


