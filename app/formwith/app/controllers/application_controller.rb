class ApplicationController < ActionController::Base
def new
end

def create
  byebug
  redirect_to articles_new_path
end

end
