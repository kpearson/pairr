require 'rails_helper'

RSpec.describe Match, type: :model do
  describe "is matcher scopes" do
    let(:steve) { create :user}
    let(:horace) { create :user}
    let(:rachel) { create :user}
    let(:jeff) { create :user}
    let(:josh) { create :user}


    it 'should have one matcher' do
      horace.matchers << jeff
      expect(horace.matchers.count).to eq 1
      expect(jeff.matchees.count).to eq 1
      expect(jeff.matchers.count).to eq 0
    end

    it 'should have the right number of rejected matches' do
      Match.create!(matcher_id: jeff.id, matchee_id: horace.id, rejected: true)
      Match.create!(matcher_id: rachel.id, matchee_id: horace.id, rejected: true)
      expect(User.matchers_rejected(User.matchers(horace)).count).to eq 2
      expect(User.matchees_rejected(User.matchees(jeff)).count).to eq 1
    end

    it 'should have the right number of selected matches' do
      Match.create!(matcher_id: jeff.id, matchee_id: horace.id, rejected: false)
      Match.create!(matcher_id: rachel.id, matchee_id: horace.id, rejected: false)
      expect(User.matchers_selected(User.matchers(horace)).count).to eq 2
      expect(User.matchees_selected(User.matchees(jeff)).count).to eq 1
    end

  end
end
