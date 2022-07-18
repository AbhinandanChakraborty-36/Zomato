require 'rails_helper'

RSpec.describe User, type: :model do
  
  it { should have_many(:reviews) } 
  it { should have_many(:ords) } 
  it { should have_many(:books) } 
  
  
  it "has a valid email" do
   user= build(:user,email:"adm",password:"Test",password_confirmation:"Test")
   expect(user).to_not be_valid   
   user= build(:user,email:"",password:"Test",password_confirmation:"Test")
   expect(user).to_not be_valid
   user= build(:user,email:"admin@gmail.com",password:"Test",password_confirmation:"Test")
   expect(user).to be_valid  
  end

  it "has a valid password" do
    user= build(:user,password:"",password_confirmation:"")
    expect(user).to_not be_valid   
    user= build(:user,password:"Admin",password_confirmation:"admin")
    expect(user).to_not be_valid 
    user= build(:user,password:"Admin",password_confirmation:"Admin")
    expect(user).to be_valid 
  end
end
