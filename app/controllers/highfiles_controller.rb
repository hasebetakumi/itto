class HighfilesController < ApplicationController
    def new
        # 新規登録用
        @highfile = Highfile.new
        
        # 一覧用データ渡し
        @highfiles = Highfile.all.order(created_at: :DESC)
    end
    
    def create
        Highfile.create(create_params)
        redirect_to new_highfile_path
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
    def create_params
        params.require(:highfile).permit(:student_id, :image_name, :image).merge(user_id: current_user.id)
    end
end
