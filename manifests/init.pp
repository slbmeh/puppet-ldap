# = Class: ldap
#
# The main class handles ldap client configuration and
# nss_ldap and pam_ldap options.
#
# Additional parametrized classes:
#  ldap::server::master
#  ldap::server::slave
#
# == Parameters
#
# LDAP Specific class parameters
#
# [*uri*]
#   Fully qualified URI to the LDAP server.
#   Can be defined also by the (top scope) variable $ldap_uri
#
# [*basedn*]
#   The base dn to be used in searches.
#   Can be defined also by the (top scope) variable $ldap_basedn
#
# [*pversion*]
#   The LDAP protocol to be used. Defaults to '3'.
#   Can be defined also by the (top scope) variable $ldap_pversion
#
# [*ssl*]
#   The LDAP clients should connect using SSL.
#   Can be defined also by the (top scope) variable $ldap_ssl
#
# [*cert*]
#   Filename for the server certificate.
#   Can be defined also by the (top scope) variable $ldap_cert
#
# [*use_nss*]
#   Setting this variable allows puppet to manage the nss configuration.
#   Can be defined also by the (top scope) variable $ldap_use_nss
#
# [*nss_passwd*]
#   The DN to search for passwd attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_passwd
#
# [*nss_shadow*]
#   The DN to search for shadow attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_shadow
#
# [*nss_group*]
#   The DN to search for group attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_group
#
# [*nss_hosts*]
#   The DN to search for host attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_hosts
#
# [*nss_services*]
#   The DN to search for service attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_services
#
# [*nss_networks*]
#   The DN to search for network attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_networks
#
# [*nss_protocols*]
#   The DN to search for protocol attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_protocols
#
# [*nss_rpc*]
#   The DN to search for rpc attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_rpc
#
# [*nss_ethers*]
#   The DN to search for ether attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_ethers
#
# [*nss_netmasks*]
#   The DN to search for netmask attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_netmasks
#
# [*nss_bootparams*]
#   The DN to search for bootparam attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_bootparam
#
# [*nss_aliases*]
#   The DN to search for alias attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_alias
#
# [*nss_netgroup*]
#   The DN to search for netgroup attributes. The basedn is appended to this value.
#   Can be defined also by the (top scope) variable $ldap_nss_netgroup
#
# [*use_pam*]
#   Setting this variable allows puppet to manage the pam configuration.
#   Can be defined also by the (top scope) variable $ldap_use_pam
#
# [*pam_login*]
#   Attribute used for the user's login
#   Can be defined also by the (top scope) variable $ldap_pam_login
#
# [*pam_member*]
#   Defaults to member
#   Can be defined also by the (top scope) variable $ldap_pam_member
#
# [*pam_passwd*]
#   Method used to change the user's password.
#   Can be defined also by the (top scope) variable $ldap_pam_passwd
#
# [*pam_filter*]
#   LDAP filter for valid users.
#   Can be defined also by the (top scope) variable $ldap_pam_filter
#
# Standard class parameters
# Define the general class behaviour and customizations
#
# [*my_class*]
#   Name of a custom class to autoload to manage module's customizations
#   If defined, foo class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $foo_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, foo main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $foo_source
#
# [*source_dir*]
#   If defined, the whole foo configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $foo_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $foo_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, foo main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $foo_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $foo_options
#
# [*service_autorestart*]
#   Automatically restarts the foo service when there is a change in
#   configuration files. Default: true, Set to false if you don't want to
#   automatically restart the service.
#
# [*version*]
#   The package version, used in the ensure parameter of package type.
#   Default: present. Can be 'latest' or a specific version number.
#   Note that if the argument absent (see below) is set to true, the
#   package is removed, whatever the value of version parameter.
#
# [*absent*]
#   Set to 'true' to remove package(s) installed by module
#   Can be defined also by the (top scope) variable $foo_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $foo_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $foo_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $foo_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for foo checks
#   Can be defined also by the (top scope) variables $foo_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $foo_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $foo_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $foo_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $foo_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for foo port(s)
#   Can be defined also by the (top scope) variables $foo_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling foo. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $foo_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $foo_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $foo_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $foo_audit_only
#   and $audit_only
#
# Default class params - As defined in foo::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of foo package
#
# [*service*]
#   The name of foo service
#
# [*service_status*]
#   If the foo service init script supports status argument
#
# [*process*]
#   The name of foo process
#
# [*process_args*]
#   The name of foo arguments. Used by puppi and monitor.
#   Used only in case the foo process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user foo runs with. Used by puppi and monitor.
#
# [*config_dir*]
#   Main configuration directory. Used by puppi
#
# [*config_file*]
#   Main configuration file path
#
# [*config_file_mode*]
#   Main configuration file path mode
#
# [*config_file_owner*]
#   Main configuration file path owner
#
# [*config_file_group*]
#   Main configuration file path group
#
# [*config_file_init*]
#   Path of configuration file sourced by init script
#
# [*pid_file*]
#   Path of pid file. Used by monitor
#
# [*data_dir*]
#   Path of application data directory. Used by puppi
#
# [*log_dir*]
#   Base logs directory. Used by puppi
#
# [*log_file*]
#   Log file(s). Used by puppi
#
# [*port*]
#   The listening port, if any, of the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Note: This doesn't necessarily affect the service configuration file
#   Can be defined also by the (top scope) variable $foo_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $foo_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include foo"
# - Call foo as a parametrized class

# == Parameters:
# 
# == Actions:
#  Creation and management of ldap.conf
#
# == Requires:
#   - Class nsswitch
#   - Class pam
#
# == Tested/Works on:
#   - Debian: 5.0   / 6.0   /
#   - RHEL    5.2   / 5.4   / 5.5   / 6.1   / 6.2 
#   - OVS:    2.1.1 / 2.1.5 / 2.2.0 / 3.0.2 /
#
# == Sample Usage:
# 
# class { 'ldap':
#	uri  => 'ldap://ldapserver00 ldap://ldapserver01',
#	base => 'dc=suffix',
#	ssl  => false,
# }
#
# class { 'ldap':
#	uri        => 'ldap://ldapserver00 ldap://ldapserver01',
#	base       => 'dc=suffix',
#	ssl        => false,
#
#	nsswitch   => true,
#	nss_passwd => 'ou=users',
#	nss_shadow => 'ou=users',
#	nss_group  => 'ou=groups',
#
#	pam        => true,
# }
#

class ldap(
  $uri,
  $base,

	$version  = '3',
	$ensure   = 'present',
	$ssl      = false,
	$ssl_cert = false,
	
	# nsswitch options (requires nsswitch module) - disabled by default
	$nsswitch   = false,
	$nss_passwd = false,
	$nss_group  = false,
	$nss_shadow = false,
	
	# pam options (requires pam module) - disabled by default
	$pam            = false,
	$pam_att_login  = 'uid',
	$pam_att_member = 'member',
	$pam_passwd     = 'md5',
	$pam_filter     = 'objectClass=posixAccount'
        ) inherits ldap::params {

	include ldap::install
	include ldap::config
}

