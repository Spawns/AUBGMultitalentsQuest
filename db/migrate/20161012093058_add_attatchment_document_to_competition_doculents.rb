class AddAttatchmentDocumentToCompetitionDoculents < ActiveRecord::Migration
  def self.up
    change_table :competition_documents do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :competition_documents, :document
  end
end
