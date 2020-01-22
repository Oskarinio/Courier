class Package < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :adress, presence: true, length: { maximum: 50 }

  attr_accessor :status

  def check_status
    if self.status == false
      "Pending"
    else
      "Delivered"
    end
  end
end
