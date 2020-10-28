module ApplicationHelper
  # rubocop: disable Style/HashSyntax
  def flash_message
    if flash[:notice]
      content_tag :p, notice, :class => 'bg-success m-0 text-white text-center p-2'
    elsif flash[:notice]
      content_tag :p, alert, :class => 'bg-danger m-0 text-white text-center p-2'
    end
  end
  # rubocop: enable Style/HashSyntax
end
