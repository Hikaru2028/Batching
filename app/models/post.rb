class Post < ApplicationRecord

 has_many :likes, dependent: :destroy
 has_many :liked_users, through: :likes, source: :user

 has_many :comments, dependent: :destroy

 belongs_to :user

  validates :start_time, presence: true
  validates :end_time, presence: true

end
