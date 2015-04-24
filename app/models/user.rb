class User < ActiveRecord::Base
  default_scope { order('LOWER(name)') }
  scope :recent, -> { where("created_at > ?", 1.week.ago)}
  scope :except_current, -> (user) { where.not(id: user) }

  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  has_many :given_kudos, class_name: 'Kudo', foreign_key: 'giver_id'
  has_many :received_kudos, class_name: 'Kudo', foreign_key: 'receiver_id'

  def set_default_role
    self.role ||= :user
  end

  def received_kudos
    id = self.id
    Kudo.where("receiver_id @> '{?}'", id)
  end

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    #Uncomment the section below if you want users to be created if they don't exist
    unless user
        user = User.create(name: data["name"],
           email: data["email"],
           password: Devise.friendly_token[0,20]
        )
       end
      user
    end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

end
