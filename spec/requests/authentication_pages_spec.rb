require 'spec_helper'

describe "Authentication" do
  	
  	subject { page }

  	describe "signin page" do
  		before { visit signin_path }

  		it { should have_content('Login') }
  		it { should have_title('Sign in') }
  	end

  	describe 'signin' do
  		before { visit signin_path }

  		describe "with invalid information" do
	  		before { click_button "Login" }

	  		it { should have_title('Sign in') }
	  		it { should have_selector('div.alert.alert-error', text: "Invalid") }

	  		describe "after visiting another page" do
	  			before { click_link "Home" }
	  			it { should_not have_selector('div.alert.alert-error') }
	  		end
  		end

  		describe "with valid information" do
  			let(:user) { FactoryGirl.create(:user) }
			before do
				fill_in "Email", with: user.email.upcase
				fill_in "Password", with: user.password
				click_button "Login"
			end

			it { should have_title(user.name) }
			it { should have_link('My Account', href: user_path(user)) }
			it { should have_link('Logout', href: signout_path) }
			it { should_not have_link('Login', href: signin_path) }

                  describe "followed by singout" do
                  	before  { click_link "Logout" }
                  	it { should have_link('Login') }
                  end
		end
  	end
end
