ActiveAdmin.register District do
	
  permit_params :number, :voter, :ballot, :invalid_vote, :voivodship_id,:voivodship
  menu label: "Okręgi"

  form  do |f|
      f.inputs "District" do
        f.input :number, label: "Numer "
		f.input :voter, label: "Liczba uprawnionych do głosowania"
		f.input :ballot, label: "Liczba kart do głosowania"
		f.input :invalid_vote, label: "Liczba głosów nieważnych"
	    f.input :voivodship, as: :radio, label: "Województwo"
  end
    f.actions
  end

end


