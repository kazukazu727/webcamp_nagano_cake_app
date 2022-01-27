class HomesController < ApplicationController

  def top
    items=Item.where(is_active:true)
    @new_items = items.limit(4).order(updated_at: "DESC")
  end

  def about
  end

  def item_params
    params.require(:item).permit(:name, :image, :price,)
  end

end
