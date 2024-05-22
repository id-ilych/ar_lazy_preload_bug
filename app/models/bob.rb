class Bob < ApplicationRecord
  belongs_to :alice
  has_one :charlie
end
