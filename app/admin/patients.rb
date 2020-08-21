ActiveAdmin.register Patient do

  
  permit_params :name, :age, :disease, :admitted, :bed_id, :payment_id, :staff_id
  

  form do |f| 
    f.semantic_errors *f.object.errors.keys
    f.inputs "Patent Details" do 
      f.input :name 
      f.input :age
      f.input :disease 
      f.input :admitted , label: 'Is Patient Admitted?'
      f.input :bed_id, :as => :select, :collection => Bed.all.collect {|bed|  [bed.name+ ", price_per_day-Rs."+ bed.price_per_day.to_s, bed.id]}
      f.input :payment_id,  :as => :select, :collection => Payment.all.collect {|pay| [pay.paymenttype,  pay.id]}
      f.input :staff_id,  :as => :select, :collection => Staff.where(doctor: true).collect {|doc| [doc.name + "-" +doc.designation, doc.id]}
    end
    f.actions
  end  
end
