class ServiceTask < ApplicationRecord
  include Serviceable

  enum :standard, { Section508: "Section508", WCAG2A: "WCAG2A", WCAG2AA: "WCAG2AA", WCAG2AAA: "WCAG2AAA" }, default: :WCAG2AA

  validates :name, presence: true
  validates :url, presence: true

  def self.to_service_json(id)
    self.select(:name, :url, :standard).find(id).to_json(except: :id)
  end
end
