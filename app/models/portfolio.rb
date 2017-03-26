class Portfolio < ApplicationRecord
  validates :title, :body, :main_image, :thumb_image, presence: true

  scope :angular, -> { where(subtitle: 'Angular').order(created_at: :desc) }
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails').order(created_at: :desc) }

  after_initialize :set_defaults

  private

  def set_defaults
    self.main_image ||= 'http://placehold.it/600x400'
    self.thumb_image ||= 'http://placehold.it/350x200'
  end
end
