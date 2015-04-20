class Kudo < ActiveRecord::Base
  belongs_to :giver, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :kudoizations
  has_many :kudotypes, through: :kudoizations

  validates :comments, presence: true
end
