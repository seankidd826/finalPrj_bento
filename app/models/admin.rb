module Admin
  # has_attached_file :mompic, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>",:special => "500x300>" }, :default_url => "/images/:style/missing.png"
  # validates_attachment_content_type :mompic, :content_type => /\Aimage\/.*\Z/
  def self.table_name_prefix
    'admin_'
  end

end
