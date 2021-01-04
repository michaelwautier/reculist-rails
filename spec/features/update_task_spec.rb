require 'rails_helper'

RSpec.describe 'Updating a task', type: :feature do
  scenario 'valid inputs' do
    user = User.create!(email: 'michael@reculist.com', password: '123456')
    login_as(user, scope: :user)
    aeck = Task.create!(title: 'Finir Aeck.io', category: 'code', user: user)
    visit edit_task_path(aeck)
    fill_in 'Titre', with: 'Convertir les images webp en jpg'
    click_on 'Update Task'
    visit tasks_path
    expect(page).to have_content('Convertir les images webp en jpg')
  end
end
