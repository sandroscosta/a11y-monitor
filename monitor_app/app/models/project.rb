class Project < ApplicationRecord
  enum :standard, { Section508: "Section508", WCAG2A: "WCAG2A", WCAG2AA: "WCAG2AA", WCAG2AAA: "WCAG2AAA" }, default: :WCAG2AA
  enum :seal_level, [:not_applicable, :bronze, :silver, :gold], default: :not_applicable
  has_one_attached :screenshot

  after_create :create_slug

  validates :name, presence: true
  validates :name, uniqueness: true
  
  def has_seal?
    self.seal_date.present?
  end

  #def to_param
  #  slug
  #end

  private

  def create_slug
    self.slug = name.parameterize
  end

end
