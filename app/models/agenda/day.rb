class Day < ActiveRecord::Base
  has_many :events
  accepts_nested_attributes_for :events,
    :allow_destroy => true,
    :reject_if     => :all_blank

  validates :number , presence: true
end
