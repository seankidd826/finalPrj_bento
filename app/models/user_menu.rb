class UserMenu < ActiveRecord::Base
  belongs_to :user
  belongs_to :menu, :counter_cache => true
end
