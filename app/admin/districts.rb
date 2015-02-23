ActiveAdmin.register District do
	
  permit_params :name, :voter, :ballot, :voivodship_id,:voivodship
  menu label: "Okręgi"

  #filter :name, label: "Nazwa"
  filter :voivodship, label: "Województwo"


  index do
    selectable_column
    id_column
    column :name
    column :created_at
    actions
  end



  form  do |f|
      f.inputs "District" do
        f.input :name, label: "Numer "
		    f.input :voter, label: "Liczba uprawnionych do głosowania"
		    f.input :ballot, label: "Liczba wydanych kart do głosowania"
	      f.input :voivodship, as: :radio, label: "Województwo"
  end
    f.actions
  end

end


