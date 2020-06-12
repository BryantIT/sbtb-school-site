class NewsletterSerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :author, :published, :body
end
