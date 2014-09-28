define online-migration::db ($dbname) {
 
  file {
     "${online-migration::folder}/${dbname}":
	owner   => root,
	source  => "puppet:///modules/online-migration/$dbname/",
        ensure  => directory,
        recurse => true,
        require => File["${online-migration::folder}];
  }

}
