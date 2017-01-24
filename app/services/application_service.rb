class ApplicationService
  def call
    result = nil
    ActiveRecord::Base.transaction do
      result = execute!
    end
    result
  end

  private

  def execute!
    raise NotImplementedError
  end
end
