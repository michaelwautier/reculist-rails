require 'rails_helper'

RSpec.describe 'Creating a subtask', type: :feature do
  before do
    user = User.create!(email: 'michael@reculist.com', password: '123456')
    login_as(user, scope: :user)
    aeck = Task.create!(title: 'Finir Aeck.io', category: 'code', user: user)
    visit new_task_subtask_path(aeck)
  end

  scenario 'valid inputs' do
    fill_in 'Contenu', with: 'Convertir les images webp en jpg'
    click_on 'Create Subtask'
    visit tasks_path
    expect(page).to have_content('Convertir les images webp en jpg')
  end

  scenario 'without input' do
    fill_in 'Contenu', with: ''
    click_on 'Create Subtask'
    expect(page).to have_content("can't be blank")
  end
end
