class ErrorsController < ApplicationController
  def error_404
    render "errors/404"
  end
  def error_401
    render "errors/401"
  end
  def error_500
    render "errors/500"
  end
end
