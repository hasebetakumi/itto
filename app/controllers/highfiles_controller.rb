class HighfilesController < ApplicationController
    def new
        # 新規登録用
        @highfile = Highfile.new
        
        # 一覧用データ渡し
        @highfiles = Highfile.all.order(created_at: :DESC)
    end
    
    def create
        
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    def destroy
        
    end
    
    private
    
end
