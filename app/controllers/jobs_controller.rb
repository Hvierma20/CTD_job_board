class JobsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :catch_not_found
    before_action :find_job, only: [:show, :edit, :update, :destroy]
    def index
        if params[:category].blank?
            @jobs = Job.all.order("created_at DESC")
        else 
            @category_id = Category.find_by(name: params[:category]).id
            @jobs = Job.where(category_id: @category_id).order("created_at DESC")
        end
    end

    def show
    end

    def new
        @job = Job.new
    end

    def create
        @job = Job.new(jobs_params)

        if @job.save
            redirect_to @job
        else
            flash.notice = "Please enter the complete info"
            render :new
        end
    end

    def edit
    end

    def update
        if @job.update(jobs_params)
            flash.notice = "The job was updated successfully."
            redirect_to @job
        else
            flash.now.alert = @customer.errors.full_messages.to_sentence
            render "Edit"
        end
    end

    def destroy
        @job.destroy
        redirect_to root_path
    end

    private

    def jobs_params
        params.require(:job).permit(:title, :description, :company, :url, :category_id)
    end

    def find_job
        @job = Job.find(params[:id])
    end
end
