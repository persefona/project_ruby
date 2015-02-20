ActiveAdmin.register Role do 
	permit_params :name, :description
	menu label: "Role"

	form  do |f|
      f.inputs "Role" do
        f.input :name, label: "Nazwa"
        f.input :description, label: "Opis"
       
       
  end
    f.actions
  end

end
