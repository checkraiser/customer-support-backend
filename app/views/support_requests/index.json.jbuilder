json.cache! resource do
  json.array! resource, partial: 'support_requests/support_request', as: :support_request
end
