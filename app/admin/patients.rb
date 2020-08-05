ActiveAdmin.register Patient do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :age, :disease, :admitted, :beds_id, :payments_id, :staffs_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :age, :disease, :admitted, :beds_id, :payments_id, :staffs_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f| 
    f.semantic_errors *f.object.errors.keys
    f.inputs "Patent Details" do 
      f.input :name 
      f.input :age
      f.input :disease 
      f.input :admitted
      f.input :beds_id, :as => :select, :collection => Bed.all.collect {|bed|  [bed.name+ ", price_per_day-Rs."+ bed.price_per_day.to_s, bed.id]}
      f.input :payments_id,  :as => :select, :collection => Payment.all.collect {|pay| [pay.paymenttype,  pay.id]}
      f.input :staffs_id,  :as => :select, :collection => Staff.where(doctor: true).collect {|doc| [doc.name + "-" +doc.designation, doc.id]}
    end
    f.actions
  end  
end
