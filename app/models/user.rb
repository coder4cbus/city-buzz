class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

has_many :events
has_many :likes

  has_attached_file :avatar, styles: { medium: "300x300#", thumb: "200x200#" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def likes?(event)
  	event.likes.where(user_id: id).any?
  end
end
