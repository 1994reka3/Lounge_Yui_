class Department < ApplicationRecord

  has_many :posts, dependent: :destroy

end
