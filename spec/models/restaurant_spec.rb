require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it { should have_many(:reviews) } 
  it { should have_many(:menus) }
  it { should have_many(:ords) }  
end
