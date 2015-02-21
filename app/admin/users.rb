ActiveAdmin.register User do
  permit_params :name, :surname, :email, :district_id, :district, :role_id, :role
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



    show do
    attributes_table do
    row :name 
    row :surname
    row :role
    row :district
    row :created_at
    row :updated_at
    end
    end

  form  do |f|
      f.inputs "User" do
        f.input :name, label: "Imie"
        f.input :surname, label: "Nazwisko"
        f.input :email, label: "Email"
        f.input :district, as: :radio, label: "Okręg"
        f.input :role, as: :radio, label: "Role"
       
       
  end
    f.actions
  end


end