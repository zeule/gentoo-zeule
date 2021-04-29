EAPI="4"
SLOT="0"
KEYWORDS="amd64"

DESCRIPTION="My Apache installation with dependencies"
SRC_URI=""

IUSE="mysql php"

RDEPEND="www-servers/apache
	php? ( dev-lang/php[apache2,mysql=] )
	mysql? ( virtual/mysql
		php? ( dev-db/phpmyadmin
		)
	)
"

DEPEND=""
