require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:valid_attributes) { 
    {
      "first_name" => "Carlos",
      "last_name" => "Quiroga",
      "email" => "carlos@email.com",
      "password" => "password"
    }
  }
  context "validations"  do 
    let(:user) { User.new(valid_attributes) }

    before do
      User.create(valid_attributes)
    end

    it "requires an email" do
      expect(user).to validate_presence_of(:email)
    end

    it "requires a unique email" do
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires a unique email (case insensitive)" do
      user.email = "CARLOS@EMAIL.COM"
      expect(user).to validate_uniqueness_of(:email)
    end

    it "requires the email address to look like and email" do
      user.email = "carlos"
      expect(user).to_not be_valid
    end 
  end

  describe "#downcase_email" do
    it "makes the email attribute lower case" do
      user = User.new(valid_attributes.merge(email: "CARLOS@EMAIL.COM"))
      user.downcase_email
      expect(user.email).to eq("carlos@email.com")
    end

    it "downcases an email before saving" do
      user = User.new(valid_attributes)
      user.email = "CARLOS@EMAIL.COM"
      expect{ user.downcase_email }.to change{ user.email }.
        from("CARLOS@EMAIL.COM").
        to("carlos@email.com")
    end
  end
end





