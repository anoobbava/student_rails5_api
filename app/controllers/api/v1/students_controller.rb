class Api::V1::StudentsController < ApplicationController
  before_action :set_student, only: [:show, :update, :destroy]

  # GET /students
  def index
    render json: Student.all
  end

  # GET /students/1
  def show
    if @student.nil?
      render json: { "Bad Data": "Student not found" }
    else
      render json: @student
    end
  end

  # POST /students
  def create
    @student = Student.new(student_params)

    if @student.save
      binding.pry
      render json: @student, status: :created, location: api_v1_student_path(@student)
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    if @student.update(student_params)
      render json: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
    render json: { "status": "student #{@student.id} deleted" }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find_by_id(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def student_params
    # params.(:student, { :name, :class_name, :age, :dob, :class_number })
    params.permit(:name, :class_name, :age, :dob, :class_number)
  end
end
