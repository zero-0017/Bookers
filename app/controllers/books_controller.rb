class BooksController < ApplicationController

  def index#一覧
    @books = Book.all#データ(レコード)を全て取得
    @book = Book.new# 新規投稿
  end

  def create#新規
    @book = Book.new(book_params)# 新規投稿
    if @book.save# 投稿に成功した場合
      flash[:notice] = "Book was successfully created."# サクセスメッセージを表示
      redirect_to book_path(@book)# 詳細画面へリダイレクト
    else#書き込み失敗
      @books=Book.all#データ(レコード)を全て取得
      render :index# 投稿一覧に遷移
    end
  end

  def show#詳細
    @book = Book.find(params[:id])#データ(レコード)を1件取得
  end

  def edit#編集
    @book = Book.find(params[:id])#データ(レコード)を1件取得
  end

  def update#更新
    @book = Book.find(params[:id])#データ(レコード)を1件取得
    if @book.update(book_params)# 投稿に成功した場合
      redirect_to book_path(@book)# 詳細画面へリダイレクト
      flash[:notice] = "Book was successfully updated."# サクセスメッセージを表示
    else#書き込み失敗
      render :edit# 編集画面に遷移
    end
  end

  def destroy#削除
    book = Book.find(params[:id])#データ(レコード)を1件取得
    book.destroy#データ（レコード）を削除
    redirect_to books_path# 一覧画面へリダイレクト
    flash[:notice] = "Book was successfully destroyed."# サクセスメッセージを表示
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end