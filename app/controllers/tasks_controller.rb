class TasksController < ApplicationController
	before_action :get_task, only: [:toggle_status, :update_content, :update, :destroy]

	def index
		@task = Task.new

		if params.has_key?(:status)
			@tasks = Task.find_by_status(params[:status])
		else
			@tasks = Task.all
		end

		respond_to do |format|
			format.html
		end
	end

	def all
		@tasks = Task.all

		respond_to do |format|
			format.js
		end
	end

	def active
		@tasks = Task.active

		respond_to do |format|
			format.js
		end
	end

	def completed
		@tasks = Task.completed

		respond_to do |format|
			format.js
		end
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			respond_to do |format|
				format.js
			end
		else
		end
	end

	def update
	end

	def toggle_status
		@task.toggle_status
		if @task.save
			respond_to do |format|
				format.js
			end
		else
		end
	end

	def update_content
		@task.content = params[:newcontent]
		if @task.save
			respond_to do |format|
				format.js
			end
		else
		end
	end

	def destroy
		@task.destroy

		respond_to do |format|
			format.js
		end
	end

	private

	def task_params
		params.require(:task).permit(:content, :status, :newcontent)
	end

	def get_task
		@task = Task.find(params[:id])
	end
end
