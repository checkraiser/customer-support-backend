require 'rails_helper'

describe UserCreationManager, freeze: true do
  subject { described_class.new }

  describe '#create' do
    let(:params) { attributes_for(:customer) }

    it 'creates user' do
      expect { subject.create(params) }.to change(User, :count).by(1)
    end

    context 'when email exists in db' do
      before { subject.create(params) }

      it 'raises error ApplicationError' do
        expect { subject.create(params) }.to raise_error(ApplicationError)
      end
    end
  end
end
