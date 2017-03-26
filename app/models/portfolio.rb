class Portfolio < ApplicationRecord

  scope :angular, -> { where(subtitle: 'Angular').order(created_at: :desc) }
  scope :ruby_on_rails, -> { where(subtitle: 'Ruby on Rails').order(created_at: :desc) }
end
