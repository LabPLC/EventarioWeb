class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  rescue_from CanCan::AccessDenied do |ex|
    puts ex.message
    redirect_to root_url, :alert => ex.message
  end

  def verified_request?
    if request.content_type == "application/json"
      true
    else
      super()
    end
  end

end

