module ApiCommon
  extend ActiveSupport::Concern

  private

  def no_resource?
    action.index? || action.create?
  end

  def action
    params[:action].inquiry
  end

  def controller_name
    params[:controller]
  end

  def resource_class
    controller_name.singularize.classify.constantize
  end

  def search_class_name
    controller_name.pluralize.capitalize
  end

  def with_deleted?
    resource_class.respond_to?(:with_deleted)
  end

  def destroying?
    action.destroy? && with_deleted?
  end
end
