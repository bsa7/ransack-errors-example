class CompanySearchForm
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Validations::Callbacks
  include ActiveRecord::AttributeAssignment

  attr_reader :name

  validates :name, presence: true

  def initialize(name:)
    @name = name
  end

  def validate
    errors.add(:name, 'size of search is too long') if name&.size&.positive? && name.size > 5
  end
end
