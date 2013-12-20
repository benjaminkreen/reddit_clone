class Sub < ActiveRecord::Base
  validates :name, :user_id, :presence => true

  attr_accessible :name, :user_id, :link_ids

  belongs_to(
    :moderator,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
  )

  has_many :link_subs

  has_many(
    :links,
    :through => :link_subs,
    :source => :link
  )

  accepts_nested_attributes_for :links

end
