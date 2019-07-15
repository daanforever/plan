# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  title         :string
#  user_id       :integer
#  assignee_id   :integer
#  assignee_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Task < ApplicationRecord
  belongs_to :user
  belongs_to :assignee, polymorphic: true
  # has_one :position, through: :meta
  has_many :meta, class_name: 'Meta', dependent: :destroy

  before_validation do
    self.assignee = self.user unless self.assignee.present?
  end

  after_create do
    self.meta.create!(user: self.user, position: self.id)
  end
end
