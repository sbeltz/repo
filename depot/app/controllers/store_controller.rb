include ActionView::Helpers::TextHelper

class StoreController < ApplicationController
  def index
    counter = current_count
    @message = ''
    if (counter > 5)
        @message = 'You have been here ' + pluralize(counter, 'time') + ' before'
    end
    @products = Product.order(:title)
    @cart = current_cart
  end
end
