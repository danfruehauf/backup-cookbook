# Define a generic template to use with the backup rock
define :backup do

  cookbook        = params[:cookbook] || "backup"
  model           = params[:model]    || "default"
  model_file_path = "#{node[:backup][:models_dir]}/#{params[:name]}.sh"

  template model_file_path do
    source   "model_#{model}.sh.erb"
    cookbook cookbook
    owner    node[:backup][:username]
    group    node[:backup][:group]
    mode     0644
    variables(
      :name       => params[:name],
      :backup_dir => backup_dir,
      :params     => params
    )
  end

end
