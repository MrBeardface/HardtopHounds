class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :favorite_projects, dependent: :destroy
  has_many :favorite_blogs, dependent: :destroy
  has_many :favorite_topics, dependent: :destroy
  
  before_save { self.email = email.downcase }

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validate :password_confirmation, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  validates :password_confirmation, length: {minimum: 6}, on: :update, allow_blank: true
  
  has_attached_file :avatar, :default_url => "/images/missing.png",
    :path => ":rails_root/public/:attachment/:id/:style/:basename.:extension",
    :url  => "/:attachment/:id/:style/:basename.:extension", 
      :styles => {
        :thumb=> "100x100>"
          }
    validates_attachment :avatar
    validates_attachment :avatar, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
           size: { less_than: 5.megabytes }
    validates_attachment_file_name :avatar, :matches => [/png\Z/, /jpe?g\Z/, /jpg\Z/, /gif\Z/]

  def current_user=(user)
    @current_user = user
  end
  
  def name 
    [first_name, last_name].join(' ')
  end
end
