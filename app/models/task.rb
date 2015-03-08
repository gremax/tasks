class Task < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :project

  def self.incomplete
    where(done: false).order('priority')
  end

  def self.complete
    where(done: true).order('updated_at')
  end
end
