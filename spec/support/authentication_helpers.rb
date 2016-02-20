module AuthenticationHelpers
  module Controller
    def sign_in(user)
      # controller.stub(:current_user).and_return(user)
      # controller.stub(:user_id).and_return(user.id)
      allow(controller).to receive(:current_user).and_return(user)
      # allow(controller).to receive(:user_id).and_return(user.id)
      session[:user_id] = user.id
      # puts "***********************" + "#{session['user_id']}" + "***********************"
      # puts user.id
    end
  end

  module Feature
    def sign_in(user, options={})
      visit "/login"
      fill_in "Email", with: user.email
      fill_in "Password", with: options[:password]
      click_button "Log In"
    end
  end
end