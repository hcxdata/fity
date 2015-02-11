module FacebookClient
  extend ActiveSupport::Concern

  def facebook_client
  	if Project.facebook_access_token
    	@facebook_client = Koala::Facebook::API.new(Project.facebook_access_token)
    else
    	@facebook_client = Koala::Facebook::API.new
    end
  end
end
