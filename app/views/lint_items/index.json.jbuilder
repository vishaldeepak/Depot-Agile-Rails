json.array!(@lint_items) do |lint_item|
  json.extract! lint_item, :id, :product_id, :cart_id
  json.url lint_item_url(lint_item, format: :json)
end
