require 'rails_helper'

RSpec.describe Link, type: :model do
  # Test associations
  it { should have_many(:headers).dependent(:destroy) }

  # Test validations
  it { should validate_presence_of(:url) }
end
