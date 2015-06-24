class User < ActiveRecord::Base
  has_many :user_languages
  has_many :languages, -> { uniq }, through: :user_languages

  validates :uid, :provider, presence: true
  validates :bio, length: { maximum: 500 }

  has_many :matchers, through: :matcher_matches, source: :matcher
  has_many :matcher_matches, foreign_key: :matchee_id, class_name: "Match"

  has_many :matchees, through: :matchee_matches, source: :matchee
  has_many :matchee_matches, foreign_key: :matcher_id, class_name: "Match"

  scope :matchers, ->(user) { user.matchers.references( :matcher_matches )}
  scope :matchers_rejected, ->(matchers) { matchers.where( matches: { rejected: true }) }
  scope :matchers_selected, ->(matchers) { matchers.where( matches: { rejected: false }) }

  scope :matchees, ->(user) { user.matchees.references( :matchee_matches )}
  scope :matchees_rejected, ->(matchees) { matchees.where( matches: { rejected: true }) }
  scope :matchees_selected, ->(matchees) { matchees.where( matches: { rejected: false }) }


  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)

    user.email     = auth.info.email
    user.name      = auth.info.nickname
    user.image_url = auth.info.image
    user.token     = auth.credentials.token
    user.save

    user
  end

  def posible_matches(user)
    users = User.all
    rejected(user)
  end

  def _rejected(user)
    user.matchers.references( :matcher_matches ).where( matches: { rejected: true } )
  end

  def _selected(user)
    user.matchers.references( :matcher_matches ).where( matches: { rejected: false } )
  end

end
