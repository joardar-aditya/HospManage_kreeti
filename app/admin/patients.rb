ActiveAdmin.register Patient do

  permit_params :name, :age, :disease, :admitted,:phone, :bed_id, :payment_id, :staff_id, :email, :e_con_email, :e_con_name, :e_con_phone, :voter_id, :genders_id, :dob

  form multipart: true do |f| 
    f.semantic_errors *f.object.errors.keys
    f.inputs "Patent Details" do 
      f.input :name 
      f.input :age
      f.input :email
      f.input :dob, label: "Date of birth", as: :datepicker
      f.input :genders_id, :as => :select, :collection => Gender.first(3).collect {|g|  [g.sex, g.id]}
      f.input :phone, label: "Patient Contact"
      f.input :e_con_name, label: "Emergency contact Name"
      f.input :e_con_email, label: "Emergency contact Email"
      f.input :e_con_phone, label: "Emergency contact Phone"
      f.input :disease 
      f.input :admitted , label: 'Is Patient Admitted?'
      f.input :bed_id, :as => :select, :collection => Bed.all.collect {|bed|  [bed.name+ ", price_per_day-Rs."+ bed.price_per_day.to_s, bed.id]}
      f.input :payment_id,  :as => :select, :collection => Payment.all.collect {|pay| [pay.payment_type,  pay.id]}
      f.input :staff_id,  :as => :select, :collection => Staff.where(doctor: true).collect {|doc| [doc.name + "-" +doc.designation, doc.id]}
      f.input :voter_id, as: :file
    end
    f.actions
  end
  
  sidebar :downloads, only: :show do
    h3 "Voter Id Card"
    @patient = Patient.find params[:id]
    if @patient.voter_id.attached?
       link_to  'Download' , url_for(@patient.voter_id)
    else 
      "N/A"
    end   
  end
end
