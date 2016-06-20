define ps_rsyncbackup::backup (

    $backup_source_dir		= $ps_rsyncbackup::params::backup_source_dir,
    $backup_target_dir		= $ps_rsyncbackup::params::backup_target_dir,
    $backup_exclude_dir		= "",
    $backup_rotate			= 7,
    $backup_time_hour		= 3,
    $backup_time_min		= 0,
    $backup_time_day		= "*",
    $backup_user			= "root",
    $backup_group			= "root",
    $backup_ensure			= "present",
    $backup_name			= $name,
    $backup_comment			= "",

) {

	exec { "Create ${backup_target_dir}":
		command => 'mkdir -p ${backup_target_dir}',
		creates => '${backup_target_dir}',
		path => ['/usr/bin', '/usr/sbin'],
	}
	
	file { "${backup_target_dir}":
		ensure => 'directory',
		mode => 750,
		owner => 'root',
		recurse => true,
	}

	file { "${backup_name}.sh":
    	ensure  => $backup_ensure,
    	path    => "/usr/local/sbin/${backup_name}.sh",
    	mode    => '0700',
    	owner   => $backup_user,
    	group   => $backup_group,
    	content => template('ps_rsyncbackup/rsyncbackup.sh.erb'),
	}
  
	cron { "${backup_name}":
    	ensure  => $backup_ensure,
    	command => "/usr/local/sbin/${backup_name}.sh",
    	user    => $backup_user,
    	hour    => $backup_time_hour,
    	minute  => $backup_time_min,
    	weekday	=> $backup_time_day,
    	require => File["${backup_name}.sh"],
	}


}
