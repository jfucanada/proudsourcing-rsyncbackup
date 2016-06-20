class ps_rsyncbackup (

    $backup_source_dir		= $ps_rsyncbackup::params::backup_source_dir,
    $backup_target_dir		= $ps_rsyncbackup::params::backup_target_dir  

) inherits ps_rsyncbackup::params {

	package { 'rsync':
		ensure => "present"
	}

}