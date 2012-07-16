require 'spec_helper'

describe User do 
	before{ @user = User.new(email: "example@example.com", password: "foobar", password_confirmation: "foobar") }

	subject{ @user }

	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe "when email is empty" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when email address is already taken" do
	  	before do
	  		user_with_same_email = @user.dup
	  		user_with_same_email.email = @user.email.upcase
	  		user_with_same_email.save
	  	end
	  	it { should_not be_valid }
  	end

	describe "when password is empty" do
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = "a"*5 }
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
  		before { @user.password_confirmation = "mismatch" }
  		it { should_not be_valid }
  	end
end