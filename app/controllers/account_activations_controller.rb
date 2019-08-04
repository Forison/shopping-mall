class AccountActivationsController < ApplicationController
    def edit
        user = User.find_by(email: params[:email])
        if user && !user.activation? && user.authenticated?(:activation , params[:id])
            user.update_attribute(:activated , true)
            user.update_attribute(:activated_at, Time.zone.now)
            log_in
            flash[:success] = "your account has been updated"
            redirect_to user
        else
            flash[:danger] = "invalid routes"
            redirect_to root_path
        end
    end
end
