class CreateCompetitionDocuments < ActiveRecord::Migration
  def change
    create_table :competition_documents do |t|
        t.string :name
        t.text :description
        t.timestamps
    end
  end
end
