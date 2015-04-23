class Kudo < ActiveRecord::Base
  belongs_to :giver, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :kudoizations
  has_many :kudotypes, through: :kudoizations

  validates :comments, presence: true

  before_validation do |kudo|
    kudo.receiver_id.reject!(&:blank?) if kudo.receiver_id
  end


  def the_receivers
    self.receiver_id.each do |id|
      u = User.find(id)
      u.name
    end
  end

  def receiver_names
    names = []
    self.receiver_id.each do |id|
      if id != nil
        names << User.find(id).name
      end
      names
    end
  end

end
