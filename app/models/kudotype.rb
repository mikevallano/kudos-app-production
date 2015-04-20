class Kudotype < ActiveRecord::Base
  has_many :kudoizations
  has_many :kudos, through: :kudoizations

  validates :name, presence: true
end
