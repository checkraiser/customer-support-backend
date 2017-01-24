class SupportRequestsSearch < ApplicationSearch
  use SupportRequestsIndex::SupportRequest

  scope do
    includes(:user)
  end

  searchable :title, :body

  term %i(user_id status)

  range created_at: :created_at

  order_by created_at: :created_at, default: :asc

  query :q
end
