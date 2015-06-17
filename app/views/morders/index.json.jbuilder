json.array!(@morders) do |morder|
  json.extract! morder, :id, :name, :address, :email, :pay_type
  json.url morder_url(morder, format: :json)
end
