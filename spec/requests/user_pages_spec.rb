require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com", 
      password: "foobar", password_confirmation: "foobar")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "when email is not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
    
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                         foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end  
      
          
  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end
    it { should_not be_valid }
  end
        
  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                             password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end
        
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end    
        
  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end 
  
  describe "User pages" do
    subject { page }
    
    describe "index" do
        before do
          sign_in FactoryGirl.create(:user)
          FactoryGirl.create(:user, name: "Bob", email: "bob@example.com")
          FactoryGirl.create(:user, name: "Ben", email: "ben@example.com")
          visit users_path
        end

        it { should have_title('All users') }
        it { should have_content('All users') }

        it "should list each user" do
          User.all.each do |user|
            expect(page).to have_selector('li', text: user.name)
          end
        end
      end

    describe "signup page" do
      before { visit signup_path }

      it { should have_content('Registrer') }
      it { should have_title(full_title('Registrer')) }
    end
  end
  
  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    #it { should have_content(user.name) }
    #it { should have_title(user.name) }
  end
  
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Registrer" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "user_name",         with: "Example User"
        fill_in "user_email",        with: "user@example.com"
        fill_in "user_password",     with: "foobar"
        fill_in "user_password_confirmation", with: "foobar"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "after saving the user" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }

        it { should have_link('Sign out') }
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success', text: 'Welcome') }
      end
    end
  end
       
end