class Spinach::Features::AddSupportRequest < Spinach::FeatureSteps
  When 'I create support request' do
    post support_requests_url, params
  end

  When 'I create support request with invalid params' do
    post support_requests_url, invalid_params
  end

  private

  def schema
    'comment'
  end

  def params
    {
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph
    }
  end

  def invalid_params
    {}
  end
end
