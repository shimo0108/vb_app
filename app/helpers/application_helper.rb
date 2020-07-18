# frozen_string_literal: true

module ApplicationHelper
  def get_twitter_card_info()
    twitter_card = {}
    twitter_card[:url] = "https://vbapp0108.herokuapp.com/"
    twitter_card[:title] = "LETS VOLLEY BALL"
    twitter_card[:description] = "バレーボールができる環境。きっと見つかります。/"
    twitter_card[:image] = "/Users/shimosasashouta/environment/vb/app/assets/images/home_images.jpeg/"
    twitter_card[:card] = "summary"
    twitter_card[:site] = "@pandama09396862"
    twitter_card
  end
end
