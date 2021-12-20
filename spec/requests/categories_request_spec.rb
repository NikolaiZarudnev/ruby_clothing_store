require 'rails_helper'
require 'spec_helper'
RSpec.describe 'Categories', type: :request do
  describe 'Request index' do
    subject = 'test'
    it 'assigns category title' do
      category = Category.create(title: 'test')

      expect(subject).to eq(category.title)
    end

    it 'assigns the all categories' do
      subject { Category.all }
      expect(subject).to eq('test')
    end
  end
end
