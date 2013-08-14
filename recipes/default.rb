#
# Cookbook Name:: backup
# Recipe:: default
#
# Copyright (C) 2013 Dan Fruehauf <malkodan@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#

# TODO Create backup user
# TODO Add a requirement for the users cookbook
#user [:backup][:username] do
#  home  node[:backup][:base_dir]
#  gid   node[:backup][:group]
#end

# Create all directories with right permissions
[
  node[:backup][:base_dir],
  node[:backup][:backup_dir],
  node[:backup][:models_dir],
  node[:backup][:bin_dir],
  node[:backup][:log_dir]
].each do |directory|
  directory directory do
    mode 0775
# TODO
#    owner node[:backup][:username]
#    group node[:backup][:group]
    recursive true
  end
end

# Download and deploy backup executable and plugins
backup_install_path    = "#{node[:backup][:bin_dir]}/backup.sh"
backup_tar_gz_location = "#{Chef::Config[:file_cache_path]}/backup.tar.gz"

# Download backup rock
remote_file backup_tar_gz_location do
  source   node[:backup][:download_url]
  not_if   { ::File.exists?(backup_install_path) }
  notifies :run, "execute[extract_backup_rock]", :immediately
end

# Extract backup rock
execute "extract_backup_rock" do
  command "/bin/tar --strip-components=1 -C #{node[:backup][:bin_dir]} -xf #{backup_tar_gz_location}"
  creates backup_install_path
  action  :nothing
end

