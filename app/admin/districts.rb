ActiveAdmin.register District do
	
  permit_params :name, :voter, :ballot, :voivodship_id,:voivodship
  menu label: "Okręgi"

  #filter :name, label: "Nazwa"
  filter :voivodship, label: "Województwo"



  form  do |f|
      f.inputs "District" do
        f.input :name, label: "Numer "
		    f.input :voter, label: "Liczba uprawnionych do głosowania"
		    f.input :ballot, label: "Liczba kart do głosowania"
	      f.input :voivodship, as: :radio, label: "Województwo"
  end
    f.actions
  end

end


