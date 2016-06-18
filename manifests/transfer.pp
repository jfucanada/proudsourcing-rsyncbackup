define ps_rsyncbackup::transfer (

    $backup_source_dir		= $ps_rsyncbackup::params::backup_source_dir,
    $backup_target_dir		= $ps_rsyncbackup::params::backup_target_dir,
    $backup_exclude_dir		= "",
    $backup_source_host		= "",
    $backup_time_hour		= 3,
    $backup_time_min		= 0,
    $backup_time_day		= "*",
    $backup_deleteold		= true,
    $backup_user			= "root",
    $backup_group			= "root",
    $backup_ensure			= "present",
    $backup_name			= $name,
    $backup_comment			= "",
    $backup_mail			= true,
    $backup_mail_address	= "",
    $backup_rotate			= 7,

) {

	file { "${backup_name}.sh":
    	ensure  => $backup_ensure,
    	path    => "/usr/local/sbin/${backup_name}.sh",
    	mode    => '0700',
    	owner   => $backup_user,
    	group   => $backup_group,
    	content => template('ps_rsyncbackup/rsynctransfer.sh.erb'),
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
