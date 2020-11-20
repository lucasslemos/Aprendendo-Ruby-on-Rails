class Site::WelcomeController < SiteController
  def index
    @questions = Questions.all
  end
end
