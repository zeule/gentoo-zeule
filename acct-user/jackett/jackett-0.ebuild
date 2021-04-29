EAPI=7

inherit acct-user

ACCT_USER_ID=-1
ACCT_USER_HOME=/var/lib/jackett
ACCT_USER_GROUPS=( jackett )

acct-user_add_deps
