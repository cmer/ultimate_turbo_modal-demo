class ApplicationController < ActionController::Base
  include SetFlavor

  def ensure_post_exists
    create_sample_posts if Post.count == 0
  end

  def create_sample_posts
    3.times do |i|
      Post.create!(
        title: Faker::Lorem.sentence(word_count: 4, supplemental: false, random_words_to_add: 2),
        body: Faker::Lorem.paragraph(sentence_count: rand(3..10), supplemental: false, random_sentences_to_add: 2),
        publish_on: Date.current + i.days
      )
    end
  end

  def set_modal_properties
    @padding = !(params[:padding] == "0")
    @advance = params[:advance] == "1"
    @close_button = params[:close_button] == "1"
    @override_url = "/custom-advance-history-url" if @advance
  end
end
