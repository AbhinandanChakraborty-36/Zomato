require 'rails_helper'

RSpec.describe OrdItem, type: :model do
  it { should belong_to(:ord) }
end
