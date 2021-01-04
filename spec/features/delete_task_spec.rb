require 'rails_helper'

RSpec.describe 'Deleting a task', type: :feature do
  scenario 'success' do
    user = User.create!(email: 'michael@reculist.com', password: '123456')
    login_as(user, scope: :user)

    Task.create!(title: 'Finir Aeck.io', category: 'code', user: user)

    visit tasks_path
    expect(page).to have_content('Finir Aeck.io')

    first(:css, '.delete-icon').click
    page.driver.browser.switch_to.alert.accept
    expect(page).not_to have_content('Finir Aeck.io')
  end
end
