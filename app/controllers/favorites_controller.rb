class FavoritesController < ApplicationController

  def create
    @book = Book.find(params[:book_id]) #resourceにしているため:id=> :book_idに変更している
    @favorite = current_user.favorites.new(book_id: @book.id) #引数の中でカラムidと現在選択しているidが一致しているかを確認
    @favorite.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    @favorite = current_user.favorites.find_by(book_id: @book.id)
    @favorite.destroy
  end

end
