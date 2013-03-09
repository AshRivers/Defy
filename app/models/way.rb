class Way < ActiveRecord::Base
  attr_accessible :from_storypoint, :to_storypoint, :with_text

  belongs_to :storypoint, foreign_key: "from_storypoint"
  validates :from_storypoint, :to_storypoint, :with_text, presence: true
end
