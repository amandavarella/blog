class ArticlesController < ApplicationController
    
    def index
        @articles=Article.all
    end

    def show
        @article = Article.find(params[:id])
    end 

    def new
        #The reason why we added @article = Article.new in the ArticlesController is that otherwise @article would be nil in our view, and calling @article.errors.any? would throw an error in new.html.erb
        @article=Article.new
    end

    def edit
    end

    def create
        @article = Article.new(article_params)

        
        if @article.save
            redirect_to @article
        else
            #The render method is used so that the @article object is passed back to the new template when it is rendered
            #This rendering is done within the same request as the form submission, whereas the redirect_to will tell the browser to issue another request.
            render 'new'
        end
    end

    def update
    end
    
    def destroy
    end

    #https://guides.rubyonrails.org/getting_started.html#saving-data-in-the-controller
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
