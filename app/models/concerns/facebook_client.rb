module FacebookClient
  extend ActiveSupport::Concern

  def facebook_client
    if Project.facebook_app_id && Project.facebook_app_secret
      @facebook_client = Koala::Facebook::API.new( Project.facebook_app_id + "|" + Project.facebook_app_secret )
    end
  end
end
