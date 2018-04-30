class User < ApplicationRecord
  has_many :reviews_given, class_name: 'Review', foreign_key: 'customer_id'
  has_many :reviews_received, class_name: 'Review', foreign_key: 'chef_id'
  has_many :photos
  has_and_belongs_to_many :skills
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  reverse_geocoded_by :location_lat, :location_lon
  after_validation :reverse_geocode
  
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/default_image.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_attached_file :banner, :styles => { :medium => "1000x500>", :thumb => "200x100>" }, :default_url => "/images/:style/default_banner.jpg"
  validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/

  accepts_nested_attributes_for :photos, :allow_destroy => true


  enum role: [:chef, :customer]
  # after_initialize :set_default_role, :if => :new_record?

  # def set_default_role
  #   self.role ||= :customer
  # end

  validates :name, presence: true
  validates :email, presence: true
  validates :location_lat, presence: true
  validates :location_lon, presence: true
  
end
