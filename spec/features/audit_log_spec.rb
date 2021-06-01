require 'rails_helper'

describe 'AuditLog Feature' do
  before do
    @user = FactoryBot.create(:user)
    @admin_user = FactoryBot.create(:admin_user)
    @audit_log = FactoryBot.create(:audit_log, user: @user)
    login_as(@admin_user, :scope => :user)
  end

  describe 'index' do
    it 'can be reached successfully' do
      visit audit_logs_path
      expect(page.status_code).to eq(200)
    end

    it 'renders audit log content' do
      visit audit_logs_path
      expect(page).to have_content(@audit_log.user.full_name)
    end

    it 'cannot be accessed by non admin users' do
      logout(:admin_user)
      login_as(@user, :scope => :user)

      visit audit_logs_path

      expect(current_path).to eq(root_path)
    end
  end
end