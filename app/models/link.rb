class Link < ActiveRecord::Base
  validates :title, :url, :user_id, :presence => true
  attr_accessible :title, :url, :body, :user_id, :sub_ids



  belongs_to(
    :submitter,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
  )

  has_many :link_subs

  has_many(
    :subs,
    :through => :link_subs,
    :source => :sub
  )

end
