class Kudotype < ActiveRecord::Base
  has_many :kudoizations
  has_many :kudos, through: :kudoizations
end
