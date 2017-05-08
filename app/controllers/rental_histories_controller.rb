class RentalHistoriesController < ApplicationController
  before_action :set_rental_history, only: [:show, :edit, :update, :destroy]
  before_action :set_rental, only: [:rental]

  # GET /rental_histories
  # GET /rental_histories.json
  def index
    @rental_histories = RentalHistory.all
  end

  # GET /rental_histories/1
  # GET /rental_histories/1.json
  def show
  end

  # GET /rental_histories/new
  def new
    @rental_history = RentalHistory.new
  end

  # GET /rental_histories/1/edit
  def edit
  end

  # POST /rental_histories
  # POST /rental_histories.json
  def create
    @rental_history = RentalHistory.new(rental_history_params)

    respond_to do |format|
      if @rental_history.save
        format.html { redirect_to @rental_history, notice: 'Rental history was successfully created.' }
        format.json { render :show, status: :created, location: @rental_history }
      else
        format.html { render :new }
        format.json { render json: @rental_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def rental
    if rental?
        @rental.return_date = Date.today
        @rental_history = @rental
    else
        @rental_history = RentalHistory.new(book_id: @book.id, employee_id: @emp.id, borrow_date: Date.today)
    end
    if @rental_history.save
        render json: {status: "ok", code: 200, content: {message: @rental_history}}
    else
        raise StandardError 
    end
  end


  # PATCH/PUT /rental_histories/1
  # PATCH/PUT /rental_histories/1.json
  def update
    respond_to do |format|
      if @rental_history.update(rental_history_params)
        format.html { redirect_to @rental_history, notice: 'Rental history was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental_history }
      else
        format.html { render :edit }
        format.json { render json: @rental_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rental_histories/1
  # DELETE /rental_histories/1.json
  def destroy
    @rental_history.destroy
    respond_to do |format|
      format.html { redirect_to rental_histories_url, notice: 'Rental history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rental_history
      @rental_history = RentalHistory.find(params[:id])
    end
    
    def set_rental
      raise ClientError if params[:employee_no].nil? || params[:book_isbn].nil? 
      @emp = Employee.find_by(no: params[:employee_no])
      @book = Book.find_by(isbn: params[:book_isbn])
      @rental = RentalHistory.where("book_id = :book_id and employee_id = :employee_id ", book_id: @book.id, employee_id: @emp.id).where( return_date: nil).order("created_at desc").first
    end
    
    def rental?
      return true unless @rental.nil?
      false
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rental_history_params
      params.require(:rental_history).permit(:book_id, :employee_id, :borrow_date, :return_date)
    end
    
end
