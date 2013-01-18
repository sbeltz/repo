class CopyProductpriceIntoLineItem < ActiveRecord::Migration
  def up
    LineItem.all.each do |line_item|
        line_item.price = line_item.product.price if line_item.product
    end
  end

  def down
  end
end
