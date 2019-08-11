class ApplicationController < ActionController::Base
    protect_from_forgery unless: -> { request.format.json? }
    include SessionsHelper
    include OrdersHelper
end
