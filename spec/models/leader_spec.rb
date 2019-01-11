require 'rails_helper'

RSpec.describe Leader, type: :model do
  describe "validation" do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of :name }
  end
end
