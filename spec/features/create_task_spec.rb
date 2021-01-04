require 'rails_helper'

RSpec.describe 'Creating a task', type: :feature do
  scenario 'valid inputs' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(user, scope: :user)
    visit new_task_path
    fill_in 'Titre', with: 'Reculist task'
    fill_in 'Categorie', with: 'Travail'
    click_on 'Create Task'
    visit tasks_path
    sleep(3)
    expect(page).to have_content('Reculist task')
  end

  scenario 'invalid inputs' do
    user = User.create!(email: 'test@example.com', password: 'f4k3p455w0rd')
    login_as(user, scope: :user)
    visit new_task_path
    fill_in 'Titre', with: ''
    fill_in 'Categorie', with: ''
    click_on 'Create Task'
    sleep(3)
    expect(page).to have_content("can't be blank")
  end
end
