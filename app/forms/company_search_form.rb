class CompanySearchForm
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Validations::Callbacks
  include ActiveRecord::AttributeAssignment

  attr_reader :name

  validates :name, presence: true

  def persisted?
    false
  end

  def initialize(name:)
    @name = name
  end

  def valid?
    validate
    return false if errors.blank?

    true
  end

  def validate
    errors.add(:name) if name.size > 5
  end
end
