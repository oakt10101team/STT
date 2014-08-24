class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :trackable, :validatable #, :recoverable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :position, presence: true
  validates_inclusion_of :position, in: %w( Teacher Student ), message: "%{value} is not valid position"

  has_many :link_tracks

  def full_name
  	"#{self.first_name} #{self.last_name}"
  end

  def teacher?
    self.position == 'Teacher'
  end

end
