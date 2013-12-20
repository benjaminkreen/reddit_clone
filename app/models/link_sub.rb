class LinkSub < ActiveRecord::Base
  attr_accessible :sub_id, :link_id

  validates :link, :sub, :presence => true

  belongs_to :sub

  belongs_to :link, :inverse_of => :link_subs
end
