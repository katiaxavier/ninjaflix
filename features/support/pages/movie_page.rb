class MoviePage
    include Capybara::DSL

    def initialize
        @movie_list_css = "table tbody tr"
    end

    #Retorna uma estancia da classe
    def form
        MovieAdd.new
    end

    def sweet_alert
        SweetAlert.new
    end

    def add
        find('.nc-simple-add').click
    end

    def movie_tr(title)
        find(@movie_list_css, text: title )
    end

    def remove(title)
       movie_tr(title).find(".btn-trash").click
    end

    def has_no_movie(title)
        page.has_no_css?(@movie_list_css, text: title) #perguntando se existe um tr com o texto
    end

    def has_movie(title)
        page.has_css?(@movie_list_css, text: title) #perguntando se existe um tr com o texto
    end
end