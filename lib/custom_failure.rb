class CustomFailure < Devise::FailureApp
  def redirect_url
    URI.parse(request.referer).path if request.referer
  end

  # You need to override respond to eliminate recall
  def respond
    if http_auth?
      http_auth
    else
      redirect_to root_path
    end
  end
end