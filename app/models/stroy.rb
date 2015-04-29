class Stroy < ActiveRecord::Base

    has_attached_file :pic, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :pic, :content_type => /\Aimage\/.*\Z/

end
