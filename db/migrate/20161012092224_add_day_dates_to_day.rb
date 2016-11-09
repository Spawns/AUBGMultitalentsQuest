class AddDayDatesToDay < ActiveRecord::Migration
  def change
    def change
      rename_column :days , :event_date , :day_date
    end
  end
end
