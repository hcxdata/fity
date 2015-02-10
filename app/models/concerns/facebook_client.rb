module FacebookClient
  extend ActiveSupport::Concern

  def facebook_client
    @facebook_client = Koala::Facebook::GraphAPI.new
  end
end
