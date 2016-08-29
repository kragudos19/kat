class Channel < ActiveRecord::Base
  has_many :subscriptions
  has_many :subscribers, through: :subscriptions, source: :user


end
