ActiveAdmin.register Patient do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :age, :ds, :admitted, :bedtype, :paymentmethod, :consult
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :age, :ds, :admitted, :bedtype, :paymentmethod, :consult]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  #end
  
  form do |f| 
    f.inputs "Patent Details" do 
      f.input :name 
      f.input :age
      f.input :ds 
      f.input :admitted
      f.input :bedtype, :as => :select, :collection => Bed.all.collect {|bed|  [bed.name+ ", price_per_day-Rs."+ bed.pricepd.to_s,bed.name]}
      f.input :paymentmethod, :as => :select, :collection => Payment.all.collect {|pay| [pay.ptype]}
      f.input :consult, :as => :select, :collection => Staff.where(role: "Doctor").collect {|doc| [doc.name + "-" +doc.design, doc.name]}
    end
    f.actions
  end  
end
