class TasksController < ApplicationController
    
     def create
        @project=Project.find(params[:project_id])
        @task=@project.tasks.create(task_params)
         
         #追加したらHomeに飛ばす
         redirect_to project_path(@project.id)
    end
    
    
    def destroy
        @task=Task.find(params[:id])
        @task.destroy
        #projects_patah=Home画面 project_path=show画面
        redirect_to project_path(params[:project_id])
    end
    
    def toggle
        #templeteを使わない
        render nothing:true
        
        @task = Task.find(params[:id])
        @task.done =!@task.done
        @task.save
    end
    
    private
    
        #セキュリティ対策の為に一回フィルタリングをする
        def task_params
            params[:task].permit(:title)
        end

    
end
