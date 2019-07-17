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
#  state         :integer          default(0)
#

class Task < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  belongs_to :assignee, polymorphic: true
  # has_one :position, through: :meta
  has_many :meta, class_name: 'Meta', dependent: :destroy

  STATES = {
    0 => 'plan',
    1 => 'done',
    2 => 'work',
    3 => 'wait',
  }

  scope :actual, -> { where(state: [0, 2, 3]) }

  before_validation do
    self.assignee = self.owner unless self.assignee.present?
    self.title = Rails::Html::FullSanitizer.new.sanitize(self.title)
  end

  after_create do
    self.meta.create!(user: self.owner, position: self.id)
  end

  STATES.each do |k, v|
    define_method("#{v}!".to_sym) do
      self.update(state: k)
    end
  end

  # Use only for owner
  def position
    self.meta.find_by(user: self.owner)
  end
end
