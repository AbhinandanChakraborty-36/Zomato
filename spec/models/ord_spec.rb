require 'rails_helper'

RSpec.describe Ord, type: :model do
  it { should belong_to(:restaurant) } 
  it { should belong_to(:user) }
  it { should have_many(:ord_items) }  
end
