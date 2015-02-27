class Task < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :project

  def self.incomplete
    where(done: false)
  end

  def self.complete
    where(done: true)
  end
end
