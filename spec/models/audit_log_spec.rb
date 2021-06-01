require 'rails_helper'

RSpec.describe AuditLog, type: :model do
  before do
    @audit_log = FactoryBot.create(:audit_log)
  end

  describe 'creation' do
    it 'can be properly created' do
      expect(@audit_log).to be_valid
    end
  end

  describe 'validations' do
    it 'should be required to have a user association' do
      @audit_log.user_id = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should always have a status' do
      @audit_log.status = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should be required to have field started' do
      @audit_log.started = nil
      expect(@audit_log).to_not be_valid
    end

    it 'should have a started date equal to previous week monday' do
      user = FactoryBot.create(:user)
      audit_log = AuditLog.create(user_id: user.id)


      expect(audit_log.started).to eq(AuditLog.started_init_value)
    end
  end
end
