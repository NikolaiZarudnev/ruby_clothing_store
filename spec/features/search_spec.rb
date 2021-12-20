<<<<<<< HEAD
require 'spec_helper'
require 'rails_helper'
=======
require 'rails_helper'

>>>>>>> a8bcc6d5516663cd1fe371388743aada4834978a
describe 'the search process', type: :feature do
  before :each do
    Garment.create(name: 'Abibas')
  end
  it 'search Abibas' do
    visit '/categories'
    fill_in 'Поиск', with: 'Abibas'
    click_button 'Поиск'
    expect(current_path).to eq('/search')
    expect(page).to have_text('Результаты поиска')
  end
end
