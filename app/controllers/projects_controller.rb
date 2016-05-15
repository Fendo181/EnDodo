class ProjectsController < ApplicationController
    
    #before_actionで定義したものに関しては、どのアクションでもそれを実行する前に必ず実行される
    
    #RailsのDRY哲学はすごい
    #after_actionもあります
    
    before_action :set_project,only:[:show, :edit, :update,:destroy]
    
    #全部引っ張て来る
    def index
        @projects=Project.all
    end
    
    def show
    end
    
    def new
        @project=Project.new
    end
    
    def create
        @project=Project.new(project_params)
        if @project.save
            redirect_to projects_path
            #なに無かった場合はnewページに飛ぶ
        else
            render 'new'
        end
    end
    
    #場所によって動さが変わってくる
    def edit
    end
    
    def update
        if @project.update(project_params)
            redirect_to projects_path
            #なに無かった場合はnewページに飛ぶ
        else
            render 'edit'
        end
        
    end
    
    def destroy
        #Railsすげぇぇぇ！！
        @project.destroy
        redirect_to projects_path
    end
    
    private
    
        #セキュリティ対策の為に一回フィルタリングをする
        def project_params
            params[:project].permit(:title)
        end
    
        def set_project
            @project=Project.find(params[:id])
        end

end

