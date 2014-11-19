require 'rails_helper'

RSpec.describe Checker, type: :model do
  describe 'タイプが要る' do
    before { @checker = FactoryGirl.build(:checker, type: nil) }
    subject { @checker }
    it { is_expected.not_to be_valid }
  end

  describe 'checker' do
    before { @checker = FactoryGirl.build(:checker) }
    subject { @checker }
    it { is_expected.to be_valid }
  end
end
