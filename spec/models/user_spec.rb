require 'spec_helper'

describe User do

	let(:user) { FactoryGirl.create(:user) }

	subject { user }

	it { should respond_to(:first_name)}
	it { should respond_to(:last_name)}
	it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
	it { should respond_to(:password_digest)}

  it { should respond_to(:authenticate) }
  it { should respond_to(:admin) } 
  it { should_not be_admin }

  it { should respond_to(:reviews) }

  it { should be_valid }

  describe "with admin attribute set to 'true'" do
    before do
      user.save!
      user.toggle!(:admin)
    end
    it { should be_admin }
  end

  describe "when first name is not present" do
		before { user.first_name = " " }
		it { should_not be_valid }
	end
	
  describe "when last name is not present" do
		before { user.last_name = " " }
		it { should_not be_valid }
	end
	
	describe "when email is not present" do
		before { user.email = " " }
		it { should_not be_valid }
	end
	   
  describe "when password is not present" do
    before { user.password = " "; user.password_confirmation = " " }
		it { should_not be_valid }
  end

	describe "when email format is invalid" do
  	it "should be invalid" do
    		addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    		addresses.each do |invalid_address|
      		user.email = invalid_address
      		expect(user).not_to be_valid
    		end
  	end
	end

	describe "when email format is valid" do
  	it "should be valid" do
    		addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
    		addresses.each do |valid_address|
      		user.email = valid_address
      		expect(user).to be_valid
    		end
  	end
	end

	describe "when email address is already taken" do
  	it "should not be valid" do 
  		user_two = FactoryGirl.create(:user_two)
      user = FactoryGirl.build(:user, email: "najwa.azer@gmail.com")
      expect(user).to be_invalid
  	end
	end

	describe "when different case email address is already taken" do
  	it "should be invalid" do 
  		user_two = FactoryGirl.create(:user_two)
      user = FactoryGirl.build(:user, email: "NAJWA.AZER@gmail.com")
      expect(user).to be_invalid
  	end
	end

  describe "when password doesn't match confirmation" do
    before { user.password_confirmation = "mismatch" }
    it { should be_invalid }
  end
  
  describe "when password is too short" do
    before { user.password = user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end



end