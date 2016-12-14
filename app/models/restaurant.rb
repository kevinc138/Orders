class Restaurant < ActiveRecord::Base
	has_many :orders
  has_one :location, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "150x150>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
