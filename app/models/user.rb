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
  has_many :tasks_owned,    class_name: 'Task', foreign_key: 'owner_id'
  has_many :tasks_assigned, class_name: 'Task', foreign_key: 'assignee_id'
  # has_many :meta, class_name: 'Meta', through: :tasks

  def tasks
    self.tasks_owned.or(self.tasks_assigned)
      .left_outer_joins(:meta)
      .order(position: :desc)
      .select('tasks.*, meta.position')
      # .where('meta.user_id = ?', self.id)
  end
end
