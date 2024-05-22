class Alice < ApplicationRecord
  has_one :bob
  has_one :charlie, through: :bob
end
