class Kudo < ActiveRecord::Base
  belongs_to :giver, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :kudoizations
  has_many :kudotypes, through: :kudoizations

  validates :comments, presence: true

  before_validation do |kudo|
    kudo.receiver_id.reject!(&:blank?) if kudo.receiver_id
  end


  def receivers
    names = []
    self.receiver_id.each do |id|
      names << User.find(id).name
    end
    names.join(", ")
  end

end


