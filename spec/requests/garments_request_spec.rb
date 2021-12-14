require 'rails_helper'

RSpec.describe 'Garments', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns garment name' do
      garment = Garment.create(name: 'test')

      expect(subject).to eq(garment.name)
    end

    it 'assigns the all garments' do
      subject { Garment.all }
      expect(subject).to eq('test')
    end
  end
end
