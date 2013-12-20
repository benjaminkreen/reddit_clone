class Link < ActiveRecord::Base
  validates :title, :url, :user_id, :presence => true
  attr_accessible :title, :url, :body, :user_id, :sub_ids

  validate :orphan, :on => :create

  belongs_to(
    :submitter,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
  )

  has_many :link_subs, :inverse_of => :link

  has_many(
    :subs,
    :through => :link_subs,
    :source => :sub
  )

  def orphan
    # p self.subs
    # p "in orphan"
    if self.subs.count < 1
      self.errors.add(:sub_ids, "Must be related to at least one Sub")
    end
  end

end
