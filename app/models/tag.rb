class Tag < ActiveRecord::Base
  validates :channel, presence: true
  validates :channel_id, presence: true
  validates :name, presence: true
  validates :name, uniqueness: true

  before_validation :normalize_name

  belongs_to :channel

  has_and_belongs_to_many :pull_requests

  delegate :count, to: :pull_requests, prefix: true

  def self.with_active_pull_requests
    joins(:pull_requests).
      merge(PullRequest.active).
      uniq
  end

  private

  def normalize_name
    if name.present?
      self.name = name.downcase
    end
  end
end
