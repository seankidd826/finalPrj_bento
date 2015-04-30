class LineItem < ActiveRecord::Base
    belongs_to :confirm
    belongs_to :cart
    belongs_to :order
end
