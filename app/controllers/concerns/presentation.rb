module Presentation
  extend ActiveSupport::Concern

  included do
    helper_method :resource
  end

  private

  def present(object, status = nil, with: nil)
    return object if object.blank?

    @resource =
      if klass = with || presenter_class(object)
        klass.decorate object
      else
        object
      end

    render(status: status) if status
  end

  def resource
    @resource
  end

  def presenter_class(object)
    object = object.respond_to?(:to_a) ? object.first : object
    "#{object.class}Presenter".constantize
  end
end
