class ItemsController < ApplicationController

  def create
    @user = current_user
    @item = @user.items.new(item_params)
    @new_item = Item.new

    if @item.save
      flash[:notice] = "Item saved successfully."
    else
      flash[:alert] = "Item failed to save."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @user = current_user
    @item = @user.items.find(params[:id])

    if @item.destroy
      flash[:notice] = "Item was deleted successfully."
    else
      flash.now[:alert] = "There was an error deleting the item."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end


  private

  def item_params
    params.require(:item).permit(:name)
  end
end
