class Job < ActiveRecord::Base
  validates :title, presence: true
  validates :company, presence: true
  validates :url, presence: true, uniqueness: true
  validates :details, presence: true

def self.search(search)
  where("title LIKE ?", "%#{search}%")
  where("company LIKE ?", "%#{search}%")
  where("details LIKE ?", "%#{search}%")
end

end
