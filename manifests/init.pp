class online-migration ($folder="/root/om/") {
    
    case $::osfamily {
          'RedHat': {
                $provider = rpm
          }
          'Debian': {
                $provider = dpkg
          }
    }


    package {
	"online-migration":
		ensure   => installed,
		require  => [ Package['mysql-utilities'], Package['percona-toolkit'] ],
		provider => $provider,
                source   => '/vagrant/online-migration-0.3-1.noarch.rpm';
    }

    file {
        "$folder":
	   	owner    => root,
		ensure   => directory;
    }
}
