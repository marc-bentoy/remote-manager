class Machine < ApplicationRecord
  has_many :machine_stats
  belongs_to :user
end
