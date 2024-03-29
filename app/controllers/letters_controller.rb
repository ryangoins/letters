class LettersController < ApplicationController
  before_action :set_letter, only: [:show, :edit, :update, :destroy]

  # GET /letters
  # GET /letters.json
  def index
    @letters = Letter.all
  end

  # GET /letters/1
  # GET /letters/1.json
  def show
  end

  # GET /letters/new
  def new
    @letter = Letter.new
  end

  # GET /letters/1/edit
  def edit
  end

  # POST /letters
  # POST /letters.json
  def create
    @letter = Letter.new(letter_params)

    respond_to do |format|
      if @letter.save
        format.html { redirect_to @letter, notice: 'Letter was successfully created.' }
        format.json { render :show, status: :created, location: @letter }
      else
        format.html { render :new }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /letters/1
  # PATCH/PUT /letters/1.json
  def update
    respond_to do |format|
      if @letter.update(letter_params)
        format.html { redirect_to @letter, notice: 'Letter was successfully updated.' }
        format.json { render :show, status: :ok, location: @letter }
      else
        format.html { render :edit }
        format.json { render json: @letter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /letters/1
  # DELETE /letters/1.json
  def destroy
    @letter.destroy
    respond_to do |format|
      format.html { redirect_to letters_url }
      format.json { head :no_content }
    end
  end

  #Lob

  def send_letter
    @lob = Lob(api_key: "test_aef982f552057fc81ccc43a2b14e106ebe3")
    @lob.jobs.create(
      name: "Inline Test Job",
        from: {
        name: "Ryan Goins",
        address_line1: "924 S Westnedge Ave",
        city: "Kalamazoo",
        state: "MI",
        country: "US",
        zip: 48329
      },
      to: {
        name: params[:recipient_first_name][:recipient_last_name]
        address_line1: params[:recipient_street],
        city: params[:recipient_city],
        state: params[:recipient_state],
        country: "US",
        zip: params[:recipient_zip]
      }
       front: "https://www.lob.com/postcardback.pdf",
       message: "Hey Ryan, you did it! Your first letter!"
    )
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_letter
      @letter = Letter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def letter_params
      params.require(:letter).permit(:recipient_first_name, :recipient_last_name, :recipient_street, :recipient_city, :recipient_state, :recipient_zip, :content)
    end
end
