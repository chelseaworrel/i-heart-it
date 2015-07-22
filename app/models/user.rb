class User < ActiveRecord::Base

  def self.find_or_create_from_auth(oauth)
    user = User.find_or_create_by(provider: oauth.provider, uid: oauth.uid)
    user.nickname = oauth.info.nickname
    user.name = oauth.info.full_name
    user.image = oauth.info.image
    user.website = oauth.info.website
    user.token = oauth.credentials.token
    user.save
    user
  end

  def client
    @instagram_client ||= Instagram.client(access_token: token)
  end

  def media
    client.user_media_feed
  end

  def user
    client.user
  end

  def recent_media
    client.user_recent_media
  end

  def pag
    response = client.user_media_feed
    album = [].concat(response)
    max_id = response.pagination.next_max_id

    while !(max_id.to_s.empty?) do
        response = client.user_media_feed(:max_id => max_id)
        max_id = response.pagination.next_max_id
        album.concat(response)
    end
    @album = album
  end
end

# get "/user_media_feed" do
#   client = Instagram.client(:access_token => session[:access_token])
#   user = client.user
#   html = "<h1>#{user.username}'s media feed</h1>"
#
#   page_1 = client.user_media_feed(777)
#   page_2_max_id = page_1.pagination.next_max_id
#   page_2 = client.user_recent_media(777, :max_id => page_2_max_id ) unless page_2_max_id.nil?
#   html << "<h2>Page 1</h2><br/>"
#   for media_item in page_1
#     html << "<img src='#{media_item.images.thumbnail.url}'>"
#   end
#   html << "<h2>Page 2</h2><br/>"
#   for media_item in page_2
#     html << "<img src='#{media_item.images.thumbnail.url}'>"
#   end
#   html
# end
