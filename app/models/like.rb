class Like < ActiveRecord::Base
  belongs_to :menu, :counter_cache => true
  belongs_to :user
end
