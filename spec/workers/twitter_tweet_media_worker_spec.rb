require 'rails_helper'

RSpec.describe TwitterTweetMediaWorker, type: :worker do
  describe "#perform", :vcr do
    include TwitterClient
    let(:status) { twitter_client.status(567203189301473280) }
    let(:user) { create :twitter_user }
    let(:tweet) { user.tweets.where(upcode: status.id.to_s).first_or_initialize { |t| t.sync(status) } }

    before { subject.perform(tweet.id) }
    it { expect(tweet.reload).to be_media }
  end
end
