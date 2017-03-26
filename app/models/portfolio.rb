class Portfolio < ApplicationRecord
  include Placeholder
  validates :title, :body, :main_image, :thumb_image, presence: true

  scope :angular, -> { where(subtitle: 'Angular').order(created_at: :desc) }
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails').order(created_at: :desc) }

  after_initialize :set_defaults

  private

  def set_defaults
    self.main_image ||= Placeholder.image_generator(height: '600', width: '400')
    self.thumb_image ||= Placeholder.image_generator(height: '350', width: '200')
  end
end
