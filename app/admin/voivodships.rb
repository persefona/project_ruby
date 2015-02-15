ActiveAdmin.register Voivodship do
  permit_params :name, :councilman
  actions :all
  menu label: "Województwa"


   # /admin/posts/:id/comments - CZEMU TO NIE DZIAŁA ;(
  #member_action :committees do
   # @committees = resource.committees
    # This will render app/views/admin/posts/comments.html.erb
  #end


  
end
