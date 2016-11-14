class Frontend::CompetitionDocumentsController < ApplicationController
  layout 'sidebar_layout'
   def index
     @documents = CompetitionDocument.all
      add_breadcrumb "Home" , :root_path
      add_breadcrumb 'Competition Documents', frontend_competition_documents_path, :options => { :title => 'Agenda'}
   end
end
