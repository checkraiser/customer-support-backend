class Spinach::Features::ListSupportRequests < Spinach::FeatureSteps
  When 'I get the list of support requests' do
    get support_requests_url
  end

  Then 'I view only my requests' do
    expect(parsed_body.count).to eql 5
  end

  Then 'I view all requests' do
    expect(parsed_body.count).to eql 8
  end

  private

  def after_login
    create_list :support_request, 3
    create_list :support_request, 5, user: current_user
  end

  def schema
    'support_requests'
  end
end
