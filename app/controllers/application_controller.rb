class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  if true #Rails.env.production?
    # rescue_from Exception, with: :render_500
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
  end

  private

  def not_authenticated
    flash[:info] = 'ログインしてください'
    redirect_to main_app.login_path
  end

  def render_500(e = nil)
    logger.error("=========エラー発生 : ここから===========")
    logger.error(e.message)
    logger.error(e.backtrace.join("\n"))
    logger.error("=========エラー発生 : ここまで===========")
    render file: Rails.root.join("public", "500.html"), status: :internal_server_error, layout: false, content_type: "text/html"
  end

  def render_404(e = nil)
    logger.error("=========エラー発生 : ここから===========")
    logger.error(e.message)
    logger.error(e.backtrace.join("\n"))
    logger.error("=========エラー発生 : ここまで===========")
    render file: Rails.root.join("public", "404.html"), status: :not_found, layout: false, content_type: "text/html"
  end
end
