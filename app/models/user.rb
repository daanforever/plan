# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # :registerable, :recoverable, :validatable
  devise :database_authenticatable, :rememberable

  has_and_belongs_to_many :groups
  has_many :tasks
  # has_many :tasks_assigned, as: :assignee
  has_many :meta, class_name: 'Meta', through: :tasks

  def tasks_accessible
    self.tasks
      .or(Task.where(assignee: self))
      .or(Task.where(assignee: self.groups))
      .left_outer_joins(:meta)
      .where('meta.user_id = ?', self.id)
      .order('meta.position': :desc)
      .select('tasks.*, meta.position')
  end
end
