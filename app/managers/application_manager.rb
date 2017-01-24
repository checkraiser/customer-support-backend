class ApplicationManager
  def with_transaction
    result = nil
    ActiveRecord::Base.transaction do
      result = yield
    end
    result
  end
end
