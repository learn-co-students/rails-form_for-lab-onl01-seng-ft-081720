class ChangeColumnNameSchoolClasses < ActiveRecord::Migration[5.0]
  def change
    rename_column :school_classes, :name, :title
  end
end
