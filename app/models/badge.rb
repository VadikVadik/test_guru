class Badge < ApplicationRecord

  has_many :issued_badges, dependent: :destroy
  has_many :users, through: :issued_badges

end
