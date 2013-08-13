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

# Backup rock location
node['backup']['revision']     = "b2de0c60e124a3e267321880366cbc4d6bc9087e"
node['backup']['download_url'] = "https://github.com/danfruehauf/backup/archive/#{node['backup']['revision']}/backup.tar.gz"

# Base directory for backup
node['backup']['base_dir']     = '/home/backup'

# Definitions of directories we are going to use, they are relative to
# node['backup'['base_dir']
node['backup']['backup_dir']   = "#{node['backup']['base_dir']}/backup"
node['backup']['models_dir']   = "#{node['backup']['base_dir']}/models"
node['backup']['bin_dir']      = "#{node['backup']['base_dir']}/bin"
node['backup']['log_dir']      = '/var/log/backup'

# Backup username and group
node['backup']['username']     = 'backup'
node['backup']['group']        = 'backup'

# How many backups to keep locally by default?
node['backup']['backups_to_keep'] = 3
