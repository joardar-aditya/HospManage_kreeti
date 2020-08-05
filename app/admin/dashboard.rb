
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span "Welcome to HospManager Admin Dashboard"
        small "Welcome Admin"
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
       column do
         panel "New Password Requests" do
           ul do
             Staff.where(f_pass: true).collect.map do |staff|
               li link_to("Name-:  " + staff.name + "  ,  Email-:" + staff.email, admin_staff_path(staff))
             end
           end
         end
        end 
      end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end