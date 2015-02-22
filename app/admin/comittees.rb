ActiveAdmin.register Committee do
  permit_params :name, :shortname, :number_of_list, :image, voivodship_ids: []
  menu label: "Komitety"
  #includes :voivodships #chce żeby  mi wyświetlało woj.danego komitetu

  filter :name, label: "Nazwa"
  filter :shortname, label: "Skrócona nazwa"
  filter :voivodships, label: "Województwo"



  #action_item :view, only: :show do  #dodawanie nowego "click" z zadaną ścieżką
  #link_to 'View on site', committee_path(committee) 
#end

index do
    selectable_column
    id_column
    column :name, label: "Nazwa"
    column :shortname
    #column :image do
       #image_tag(image.url(:medium))
    #end
    column :created_at
    actions
  end

show do |ad|
  attributes_table do
    row :name
    row :shortname
    row :image do
      image_tag(ad.image.url(:medium))
    end
    # Will display the image on show object page
  end
 end




  form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "Committee" do
      f.input :name, label: "Nazwa komitetu"
  		f.input :shortname, label: "Skrócona nazwa"
  		f.input :number_of_list, label: "Numer listy"
  		f.input :image, :as => :file
  	  f.input :voivodships, as: :check_boxes, label: "Województwo"
  end
    f.actions
  end



end

#(:html => { :multipart => true })