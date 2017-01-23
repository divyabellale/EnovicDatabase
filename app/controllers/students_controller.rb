class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_filter :authorize
# GET /students
# GET /students.json
def index
  @students = get_collections
end

# GET /students/1
# GET /students/1.json
def show
end

# GET /students/new
def new
  @student = Student.new
end

# GET /students/1/edit
def edit
end

# POST /students
# POST /students.json
def create
  @student = Student.new(student_params)

  respond_to do |format|
    if @student.save
      format.html { redirect_to @student, notice: 'Student was successfully created.' }
      format.json { render :show, status: :created, location: @student }
    else
      format.html { render :new }
      format.json { render json: @student.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /students/1
# PATCH/PUT /students/1.json
def update
  respond_to do |format|
    if @student.update(student_params)
      format.html { redirect_to @student, notice: 'Student was successfully updated.' }
      format.json { render :show, status: :ok, location: @student }
    else
      format.html { render :edit }
      format.json { render json: @student.errors, status: :unprocessable_entity }
    end
  end
end

def download_csv_or_excel
  @students = Student.all
  respond_to do |format|
    format.html
    format.csv { send_data @students.to_csv }
format.xls # { send_data @products.to_csv(col_sep: "\t") }
end
end

def import
  Student.import(params[:file])
  redirect_to students_url, notice: "Students imported."
end

def get_collections
  relation = Student.where("")
  relation = relation.where("lower(name) LIKE ?", "%"+params[:search_name].downcase+"%") if params[:search_name]
  # relation = relation.where("phone LIKE ?",params[:search]) if params[:search] && params[:search_on] == "phone"
  relation = relation.where("lower(email) LIKE ?", "%"+params[:search_email].downcase+"%") if params[:search_email]
  relation = relation.where("course_id = ?", params[:search_course]) if params[:search_course]
  relation
end

# DELETE /students/1
# DELETE /students/1.json
def destroy
  @student.destroy
  respond_to do |format|
    format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private
# Use callbacks to share common setup or constraints between actions.
def set_student
  @student = Student.find(params[:id])
end

# Never trust parameters from the scary internet, only allow the white list through.
def student_params
  params.require(:student).permit(:name, :student_type, :address1, :father_name, :phone, :email, :dob, :father_occupation, :fee_status, :date_of_admission, :course,
    :village,:post,:panchayat,:district,:hobli,:taluq,:image,:course_id)
end
end
