class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :title, :description, :image_url, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01, less_than_or_equal_to: 1000.00}
  validates :title, uniqueness: { message: 'must be unique, silly' }
  validates :image_url, allow_blank: true, uniqueness: { message: 'must have a unique image' }, format: {
      with:     %r{\.(gif|jpg|png)$}i,
      message: 'must be a URL for GIF, JPG, or PNG image.'
  }
  validates :title, length: { :minimum => 10, :too_short => "is too short and must contain at least 10 characters" }
    
    private
    # ensure that ther eare no line items referencing this product
    def ensure_not_referenced_by_any_line_item
        if line_items.empty?
            true
        else
            errors.add(:base, 'Line items present')
            false
        end
    end

end
