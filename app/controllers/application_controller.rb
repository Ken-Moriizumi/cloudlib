class ApplicationController < ActionController::Base
  class ClientError < StandardError; end
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]

  protect_from_forgery with: :exception
  rescue_from ClientError, :with => :error_400
  rescue_from StandardError, :with => :error_500
  rescue_from Mysql2::Error, :with => :mysql_error
  
  def error_400 e=nil
    logger.error e.message
    e.backtrace.each { |line| logger.error line }
    render status:400,json: {status: "ng", code: 400, content: {message: "Invalid Parameter Value"}}
  end

  def error_500 e=nil
    logger.error e.message
    e.backtrace.each { |line| logger.error line }
    render status:500, json: {status: "ng", code: 500, content: {message: "Internal Server Error"}}
  end
  
  def mysql_error e=nil
    logger.error e.message
    e.backtrace.each { |line| logger.error line }
    if e.message =~ /^Duplicate/
        render status:400, json: {status: "ng", code: 400, content: {message: "Duplicate entry"}}
    else
        render status:500, json: {status: "ng", code: 500, content: {message: "Internal Server Error(MySQL)"}}
    end
  end

private
  def configure_permitted_parameters
  end
end
