Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:path_username", { :controller => "users", :action => "show" })
  post("/users/add_user", { :controller => "users", :action => "create" })
  post("/users/:path_username", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  post("/insert_photo_record", { :controller => "users", :action => "create" })
  post("/photos/:path_username", { :controller => "users", :action => "update" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy" })

end
