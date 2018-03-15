class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  # GET /people.json
  def index
    @people = Person.all
    respond_to do |format|
      format.html
      format.json { render json: PeopleDatatable.new(view_context) }
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  def search
    search_result =
      Person.ft_sugget(attribute: 'first_name', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'last_name', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'ssn', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'date_of_birth', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'address1', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'address2', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'city', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'state', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'postal_code', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'phone_number', prefix: params[:q]) +
      Person.ft_sugget(attribute: 'account_number', prefix: params[:q]) +
      Insurance.ft_sugget(attribute: 'name', prefix: params[:q]) +
      Insurance.ft_sugget(attribute: 'address1', prefix: params[:q]) +
      Insurance.ft_sugget(attribute: 'address2', prefix: params[:q]) +
      Insurance.ft_sugget(attribute: 'city', prefix: params[:q]) +
      Insurance.ft_sugget(attribute: 'state', prefix: params[:q]) +
      Insurance.ft_sugget(attribute: 'postal_code', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'first_name', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'last_name', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'npi', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'address1', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'address2', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'city', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'state', prefix: params[:q]) +
      Physician.ft_sugget(attribute: 'postal_code', prefix: params[:q])
    render json: search_result
  end

  # GET /people/1/edit
  def edit
  end
  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully created.' }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to @person, notice: 'Person was successfully updated.' }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: 'Person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def person_params
      params.require(:person).permit(:first_name, :last_name, :ssn, :date_of_birth, :address1, :address2, :city, :state, :postal_code, :phone_number, :account_number)
    end
end
