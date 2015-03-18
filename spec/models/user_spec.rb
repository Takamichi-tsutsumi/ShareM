require 'rails_helper'

RSpec.describe User, type: :model do
	before do
		@user = User.new(name: "Example User", email: "user@example.com", password: "foobar", password_confirmation: "foobar" )
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }

	it { should be_valid }

	describe "when password is not present" do
		before do
			@user = User.new(name: "Example User", email: "user@example.com", password: " ", password_confirmation: " ")
		end
		it { should_not be_valid }
	end

	describe "when password doesn't mach confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end
end
