module GroupHelper

  def can_view_classified_info
    @group_custom_data.get('view_classified_info') ? "TRUE" : "FALSE"
  end

  def can_delete_others
    @group_custom_data.get('delete_others') ? "TRUE" : "FALSE"
  end

end