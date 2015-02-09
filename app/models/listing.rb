class Listing < ActiveRecord::Base
	if Rails.env.production?
	has_attached_file :image, :styles => { :medium => "200x>", :thumb => "100x100>" }, :default_url => "jp.png",
	                 :storage => :dropbox,
                     :dropbox_credentials => Rails.root.join("config/dropbox.yml")
    validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
    else
    has_attached_file :image,
    :styles => { :medium => "200x", :thumb => "100x100>" }, :default_url => "jp.jpg"
  end
end

