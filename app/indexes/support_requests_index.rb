class SupportRequestsIndex < ApplicationIndex
  define_type SupportRequest.includes(:user) do
    field :user_id, type: :integer

    field :title
    field :body
    field :status, index: :not_analyzed
    field :created_at, type: :date
  end
end
