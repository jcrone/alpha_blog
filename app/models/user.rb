class User  < ApplicationRecord
  has_many :articles
  validates :username, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: {minimum: 3, max: 25}
  VALLID_EMAIL_REGEX = /\A[a-z0-9\+\-_\.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                        uniqueness: { case_sensitive: false },
                        length: {minimum: 3, max: 25},
                        format: { with: VALLID_EMAIL_REGEX}
end
