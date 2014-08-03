# coding: utf-8
require 'spec_helper'
# require 'activeadmin'

describe 'a' do
  let(:password) { 'foobar•secret' }
  let(:email) { 'john@doe.com' }
  let(:admin_user) do
    AdminUser.where(email: email).first || AdminUser.create!(email: email, password: password)
  end
  let(:other_email) { 'jane@doe.com' }
  let(:other_user) do
    AdminUser.where(email: other_email).first || AdminUser.create!(email: other_email, password: password)
  end

  before do
    Mongoid.purge!
    expect(admin_user).to be_persisted
    expect(other_user).to be_persisted
  end

  context 'when authorized' do
    before do
      visit '/admin'

      I18n.t('active_admin.devise.login.submit').should eq('Login')

      # Auth
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_on 'Login'
    end

    context 'with 1 post' do

      before do
        Post.create!(title: 'Quick Brown Fox', body: 'The quick brown fox jumps over the lazy dog.', view_count: 5, admin_user: admin_user, other_user: other_user)

        click_on 'Posts'
      end

      describe 'filters' do
        describe 'string' do
          it 'searches by title' do
            fill_in 'Title', with: 'Brown'
            click_on 'Filter'

            within '#index_table_posts' do
              page.should have_content('Quick Brown Fox')
            end

            fill_in 'Title', with: 'dog'
            click_on 'Filter'
            page.should_not have_content('Quick Brown Fox')

            fill_in 'Title', with: ''
            click_on 'Filter'

            page.should have_content('Displaying 1 Post')
          end
        end

        describe 'date_range' do
          # before { skip }
          it 'searches by created_at range' do
            fill_in 'q[created_at_gteq]', with: 1.day.ago.to_datetime.strftime("%Y-%m-%d")
            fill_in 'q[created_at_lteq]', with: 2.days.from_now.to_datetime.strftime("%Y-%m-%d")
            click_on 'Filter'

            within '#index_table_posts' do
              page.should have_content('Quick Brown Fox')
            end

            fill_in 'q[created_at_gteq]', with: 1.day.from_now.to_datetime.strftime("%Y-%m-%d")
            click_on 'Filter'
            page.should_not have_content('Quick Brown Fox')

            fill_in 'q[created_at_gteq]', with: ''
            fill_in 'q[created_at_lteq]', with: ''
            click_on 'Filter'

            page.should have_content('Displaying 1 Post')
          end
        end

      end
    end

  end # context 'when authorized'
end
