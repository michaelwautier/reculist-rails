require 'rails_helper'

RSpec.describe 'Toggling subtask completion', type: :feature do
  scenario 'success' do
    user = User.create!(email: 'michael@reculist.com', password: '123456')
    login_as(user, scope: :user)

    aeck = Task.create!(title: 'Finir Aeck.io', category: 'code', user: user)
    Subtask.create!(content: 'Convertir webp en jpg', task: aeck)
    visit tasks_path
    first(:css, '.mark_completed').click
    expect(page).to have_selector :css, 'a.mark_uncompleted'
    first(:css, '.mark_uncompleted').click
    expect(page).to have_selector :css, 'a.mark_completed'
  end
end
