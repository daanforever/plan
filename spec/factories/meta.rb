# == Schema Information
#
# Table name: meta
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  task_id    :integer
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryBot.define do
  factory :metum, class: 'Meta' do
    user { nil }
    task { nil }
    position { 1 }
  end
end
