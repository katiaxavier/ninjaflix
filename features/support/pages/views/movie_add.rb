class MovieAdd
    include Capybara::DSL

    def create(movie)
        find("input[name=title]").set movie["title"]

        select_status(movie["status"]) unless movie["status"].empty?

        find("input[name=year]").set movie["year"]
        find('input[name=release_date]').set movie["release_date"]

        add_cast(movie["cast"])

        find('textarea[name=overview]').set movie['overview']
        
        upload(movie["cover"]) unless movie["cover"].empty?

        click_button 'Cadastrar'
    end

    def alert
        find(".alert").text
    end

    def upload(file)
        cover_file = File.join(Dir.pwd, "features/support/fixtures/cover/" + file)
        cover_file = cover_file.tr("/", "\\") if OS.windows?

        Capybara.ignore_hidden_elements = false
        attach_file('upcover', cover_file)
        Capybara.ignore_hidden_elements = true
    end

    def select_status(status)
        #combobox - customizado com li's
        find('input[placeholder=Status]').click
        find(".el-select-dropdown__item", text: status).click
    end

    def add_cast(cast)
        actor = find('.input-new-tag')
        cast.each do |a|
            actor.set a
            actor.send_keys :tab
        end
    end
end