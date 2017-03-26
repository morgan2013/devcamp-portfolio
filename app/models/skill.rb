class Skill < ApplicationRecord
  include Placeholder
  validates :title, :percent_utilized, presence: true

  after_initialize :set_defaults

  private

  def set_defaults
    self.badge ||= Skill.image_generator(height: '250', width: '250')
  end
end
