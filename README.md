# proudsourcing-rsyncbackup

Puppet module to create backups using tar and transfer backups using rsync.


## Usage

	class { 'ps_rsyncbackup':	}


## Configuration

### Create backups

    ps_rsyncbackup::backup { 'myname':
    	backup_source_dir	=> "/var/www/",
    	backup_target_dir	=> "/backups/www/",
    	backup_rotate		=> 14,
    	backup_time_hour	=> 3,
    	backup_time_min		=> 0,
    }
    
    
Default values:

    $backup_source_dir		= $ps_rsyncbackup::params::backup_source_dir,	# backup source directory
    $backup_target_dir		= $ps_rsyncbackup::params::backup_target_dir,	# backup target directory
    
    $backup_rotate			= 7,				# number ob backups to keep
    $backup_time_hour		= 3,				# cronjob hour
    $backup_time_min		= 0,				# cronjob minute
    $backup_time_day		= "*",				# cronjob weekday
    $backup_user			= "root",			# user file/cron
    $backup_group			= "root",			# group file/cron
    $backup_ensure			= "present",		# create or remove
    $backup_name			= $name,			# name of backup


Optional values:

    $backup_exclude_dir		= ["dir1", "dir2"],			# exclude directories (array)
    $backup_comment			= "my comment",				# only a comment for you  


### Transfer backups

    ps_rsyncbackup::transfer { 'myname':
    	backup_source_dir	=> "/var/www/",
    	backup_target_dir	=> "/backups/www/",
    	backup_rotate		=> 14,
    	backup_time_hour	=> 3,
    	backup_time_min		=> 0,
    }
    
Default values:

    $backup_source_dir		= $ps_rsyncbackup::params::backup_source_dir,	# transfer source directory
    $backup_target_dir		= $ps_rsyncbackup::params::backup_target_dir,	# transfer target directory
    
    $backup_source_host		= "",				# source host ip/name
    $backup_time_hour		= 3,				# cronjob hour
    $backup_time_min		= 0,				# cronjob minute
    $backup_time_day		= "*",				# cronjob weekday
    $backup_user			= "root",			# user file/cron
    $backup_group			= "root",			# group file/cron
    $backup_ensure			= "present",		# create or remove
    $backup_name			= $name,			# name of transfer
    $backup_mail			= false,			# send logs per mail


Optional values:

    $backup_exclude_dir		= ["dir1", "dir2"],			# exclude directories (array)
    $backup_comment			= "my comment",				# only a comment for you  
    $backup_mail_address	= "my@address.tld"			# mail-adress for sending logs (if backup_mail = true)
    

## Changelog

	1.0.0	2013-09-13		Release
	1.1.0	2013-09-13		add backup_exlude_dir array for transfers
	1.1.1	2014-09-28		format logfile for mail (line endings)
	1.2.0	2014-12-01		add backup_exclude_dir array for backups


## License

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    

## Copyright

	Proud Sourcing GmbH 2014
	www.proudsourcing.de / www.proudcommerce.com