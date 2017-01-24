return unless support_request

json.extract! support_request,
  :id,
  :title,
  :body,
  :created_at

json.user do
  json.partial! 'users/user', user: support_request.user
end

