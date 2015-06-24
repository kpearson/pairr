class User < ActiveRecord::Base
  validates :uid, :provider, presence: true
  validates :bio, length: { maximum: 500 }

  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.email     = auth.info.email
    user.name      = auth.info.nickname
    user.image_url = auth.info.image
    user.token     = auth.credentials.token
    user.save

    user
  end
end
