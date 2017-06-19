require 'rails_helper'

RSpec.describe Header, type: :model do
  # Test associations
  it { should belong_to(:link) }

  # Test validations
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:tag) }
end
