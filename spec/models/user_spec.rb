require 'rails_helper'

describe User do
  describe 'validates phone' do
    let(:user) { build(:customer, email: 'email') }

    specify do
      expect { user.save! }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
