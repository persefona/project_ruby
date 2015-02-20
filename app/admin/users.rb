ActiveAdmin.register User do
  permit_params :name, :surname, :email, :district_id, :district
  menu label: "Użytkownicy"

   index do
    selectable_column
    id_column
    column :name
    column :surname
    column :email
    column :created_at
    actions
  end

  form  do |f|
      f.inputs "User" do
        f.input :name, label: "Imie"
        f.input :surname, label: "Nazwisko"
        f.input :email, label: "Email"
        f.input :district, as: :radio, label: "Okręg"
       
       
  end
    f.actions
  end


end