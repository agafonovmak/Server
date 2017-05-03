class ActivateNewsJob < ApplicationJob
  queue_as :default

  def perform(news_id)
    @news = News.find news_id
    @news.set_as_active!
  end
end
