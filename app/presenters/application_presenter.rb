class ApplicationPresenter < SimpleDelegator
  def self.decorate(collections)
    if collections.respond_to?(:map)
      collections.map do |item|
        new(item) if item
      end.compact
    elsif collections
      new(collections)
    end
  end

  protected

  def object
    __getobj__
  end

  def format_time(time)
    I18n.l(time, format: :short) if time
  end

  def json_datetime_format(datetime)
    datetime.to_formatted_s(:iso8601) if datetime
  end
end
