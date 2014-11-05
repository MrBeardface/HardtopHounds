class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :projects, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :journals, dependent: :destroy
  has_many :favorite_projects, dependent: :destroy
  has_many :favorite_blogs, dependent: :destroy
  has_many :favorite_topics, dependent: :destroy
  has_one :profile, dependent: :destroy
  
  before_save { self.email = email.downcase }
  after_create :build_profile

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: { case_sensitive: false }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }, on: :create
  validate :password_confirmation, presence: true, length: { minimum: 6 }, on: :create
  validates :password, length: {minimum: 6}, on: :update, allow_blank: true
  validates :password_confirmation, length: {minimum: 6}, on: :update, allow_blank: true
  
  def current_user=(user)
    @current_user = user
  end
  
  def name 
    [first_name, last_name].join(' ')
  end

  def build_profile
    @profile = Profile.create(user: self)
  end
end
