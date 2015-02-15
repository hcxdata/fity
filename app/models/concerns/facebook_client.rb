module FacebookClient
  extend ActiveSupport::Concern

  def facebook_client
    @facebook_client ||= Koala::Facebook::API.new("#{Project.facebook_app_id}|#{Project.facebook_app_secret}")
  end

  def facebook_http_options
    { proxy: Project.proxy_url }
  end
end
