require 'rails_helper'

RSpec.describe Header, type: :model do
  # Test associations
  it { should belong_to(:link) }

  # Test validations
  it { should validate_presence_of(:content) }
  it { should validate_presence_of(:tag) }
  it { should validate_inclusion_of(:tag).in_array(["h1", "h2", "h3"])}
end
