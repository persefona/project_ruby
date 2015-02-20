ActiveAdmin.register Committee do
  permit_params :name, :shortname, :number_of_list, :logo, voivodship_ids: []
  menu label: "Komitety"
  includes :voivodships #chce żeby  mi wyświetlało woj.danego komitetu



  action_item :view, only: :show do  #dodawanie nowego "click" z zadaną ścieżką
  link_to 'View on site', committee_path(committee) 
end

  form  do |f|
      f.inputs "Committee" do
      f.input :name, label: "Nazwa komitetu"
  		f.input :shortname, label: "Skrócona nazwa"
  		f.input :number_of_list, label: "Numer listy"
  		f.input :logo, :as => :file
  	  f.input :voivodships, as: :check_boxes, label: "Województwo"
  end
    f.actions
  end


end

#(:html => { :multipart => true })