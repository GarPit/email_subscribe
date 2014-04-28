class Position < ActiveRecord::Base
  belongs_to :subscriber
  belongs_to :subscription
end
