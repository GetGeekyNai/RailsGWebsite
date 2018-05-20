require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    subject { 
      described_class.new(name: 'anything', email: 'someome@name.com', phone_number: '0123456789', password: 'qwertyS01234567') }

    it 'should be invalid without name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should be invalid without email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end 
    it 'should be invalid without phone_number' do
      subject.phone_number = nil
      expect(subject).to_not be_valid
    end
    it 'should be invalid without password_digest' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'should be valid with valid attributes' do
      expect(subject).to be_valid
    end

  end

end
