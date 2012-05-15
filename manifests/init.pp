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
#   If defined, ldap class will automatically "include $my_class"
#   Can be defined also by the (top scope) variable $ldap_myclass
#
# [*source*]
#   Sets the content of source parameter for main configuration file
#   If defined, ldap main config file will have the param: source => $source
#   Can be defined also by the (top scope) variable $ldap_source
#
# [*source_dir*]
#   If defined, the whole ldap configuration directory content is retrieved
#   recursively from the specified source
#   (source => $source_dir , recurse => true)
#   Can be defined also by the (top scope) variable $ldap_source_dir
#
# [*source_dir_purge*]
#   If set to true (default false) the existing configuration directory is
#   mirrored with the content retrieved from source_dir
#   (source => $source_dir , recurse => true , purge => true)
#   Can be defined also by the (top scope) variable $ldap_source_dir_purge
#
# [*template*]
#   Sets the path to the template to use as content for main configuration file
#   If defined, ldap main config file has: content => content("$template")
#   Note source and template parameters are mutually exclusive: don't use both
#   Can be defined also by the (top scope) variable $ldap_template
#
# [*options*]
#   An hash of custom options to be used in templates for arbitrary settings.
#   Can be defined also by the (top scope) variable $ldap_options
#
# [*service_autorestart*]
#   Automatically restarts the ldap service when there is a change in
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
#   Can be defined also by the (top scope) variable $ldap_absent
#
# [*disable*]
#   Set to 'true' to disable service(s) managed by module
#   Can be defined also by the (top scope) variable $ldap_disable
#
# [*disableboot*]
#   Set to 'true' to disable service(s) at boot, without checks if it's running
#   Use this when the service is managed by a tool like a cluster software
#   Can be defined also by the (top scope) variable $ldap_disableboot
#
# [*monitor*]
#   Set to 'true' to enable monitoring of the services provided by the module
#   Can be defined also by the (top scope) variables $ldap_monitor
#   and $monitor
#
# [*monitor_tool*]
#   Define which monitor tools (ad defined in Example42 monitor module)
#   you want to use for ldap checks
#   Can be defined also by the (top scope) variables $ldap_monitor_tool
#   and $monitor_tool
#
# [*monitor_target*]
#   The Ip address or hostname to use as a target for monitoring tools.
#   Default is the fact $ipaddress
#   Can be defined also by the (top scope) variables $ldap_monitor_target
#   and $monitor_target
#
# [*puppi*]
#   Set to 'true' to enable creation of module data files that are used by puppi
#   Can be defined also by the (top scope) variables $ldap_puppi and $puppi
#
# [*puppi_helper*]
#   Specify the helper to use for puppi commands. The default for this module
#   is specified in params.pp and is generally a good choice.
#   You can customize the output of puppi commands for this module using another
#   puppi helper. Use the define puppi::helper to create a new custom helper
#   Can be defined also by the (top scope) variables $ldap_puppi_helper
#   and $puppi_helper
#
# [*firewall*]
#   Set to 'true' to enable firewalling of the services provided by the module
#   Can be defined also by the (top scope) variables $ldap_firewall
#   and $firewall
#
# [*firewall_tool*]
#   Define which firewall tool(s) (ad defined in Example42 firewall module)
#   you want to use to open firewall for ldap port(s)
#   Can be defined also by the (top scope) variables $ldap_firewall_tool
#   and $firewall_tool
#
# [*firewall_src*]
#   Define which source ip/net allow for firewalling ldap. Default: 0.0.0.0/0
#   Can be defined also by the (top scope) variables $ldap_firewall_src
#   and $firewall_src
#
# [*firewall_dst*]
#   Define which destination ip to use for firewalling. Default: $ipaddress
#   Can be defined also by the (top scope) variables $ldap_firewall_dst
#   and $firewall_dst
#
# [*debug*]
#   Set to 'true' to enable modules debugging
#   Can be defined also by the (top scope) variables $ldap_debug and $debug
#
# [*audit_only*]
#   Set to 'true' if you don't intend to override existing configuration files
#   and want to audit the difference between existing files and the ones
#   managed by Puppet.
#   Can be defined also by the (top scope) variables $ldap_audit_only
#   and $audit_only
#
# Default class params - As defined in ldap::params.
# Note that these variables are mostly defined and used in the module itself,
# overriding the default values might not affected all the involved components.
# Set and override them only if you know what you're doing.
# Note also that you can't override/set them via top scope variables.
#
# [*package*]
#   The name of ldap package
#
# [*service*]
#   The name of ldap service
#
# [*service_status*]
#   If the ldap service init script supports status argument
#
# [*process*]
#   The name of ldap process
#
# [*process_args*]
#   The name of ldap arguments. Used by puppi and monitor.
#   Used only in case the ldap process name is generic (java, ruby...)
#
# [*process_user*]
#   The name of the user ldap runs with. Used by puppi and monitor.
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
#   Can be defined also by the (top scope) variable $ldap_port
#
# [*protocol*]
#   The protocol used by the the service.
#   This is used by monitor, firewall and puppi (optional) components
#   Can be defined also by the (top scope) variable $ldap_protocol
#
#
# == Examples
#
# You can use this class in 2 ways:
# - Set variables (at top scope level on in a ENC) and "include ldap"
# - Call ldap as a parametrized class

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
  $uri                 = params_lookup( 'uri' ),
  $basedn              = params_lookup( 'basedn' ),
  $pversion            = params_lookup( 'pversion' ),
  $ssl                 = params_lookup( 'ssl' ),
  $cert                = params_lookup( 'cert' ),
  $use_nss             = params_lookup( 'use_nss' ),
  $nss_passwd          = params_lookup( 'nss_passwd' ),
  $nss_shadow          = params_lookup( 'nss_shadow' ),
  $nss_group           = params_lookup( 'nss_group' ),
  $nss_hosts           = params_lookup( 'nss_hosts' ),
  $nss_services        = params_lookup( 'nss_services' ),
  $nss_networks        = params_lookup( 'nss_networks' ),
  $nss_protocols       = params_lookup( 'nss_protocols' ),
  $nss_rpc             = params_lookup( 'nss_rpc' ),
  $nss_ethers          = params_lookup( 'nss_ethers' ),
  $nss_netmasks        = params_lookup( 'nss_netmasks' ),
  $nss_bootparams      = params_lookup( 'nss_bootparams' ),
  $nss_aliases         = params_lookup( 'nss_aliases' ),
  $nss_netgroup        = params_lookup( 'nss_netgroup' ),
  $use_pam             = params_lookup( 'use_pam' ),
  $pam_login           = params_lookup( 'pam_login' ),
  $pam_member          = params_lookup( 'pam_member' ),
  $pam_passwd          = params_lookup( 'pam_passwd' ),
  $pam_filter          = params_lookup( 'pam_filter' ),
  $my_class            = params_lookup( 'my_class' ),
  $source              = params_lookup( 'source' ),
  $source_dir          = params_lookup( 'source_dir' ),
  $source_dir_purge    = params_lookup( 'source_dir_purge' ),
  $template            = params_lookup( 'template' ),
  $service_autorestart = params_lookup( 'service_autorestart' , 'global' ),
  $options             = params_lookup( 'options' ),
  $version             = params_lookup( 'version' ),
  $absent              = params_lookup( 'absent' ),
  $disable             = params_lookup( 'disable' ),
  $disableboot         = params_lookup( 'disableboot' ),
  $monitor             = params_lookup( 'monitor' , 'global' ),
  $monitor_tool        = params_lookup( 'monitor_tool' , 'global' ),
  $monitor_target      = params_lookup( 'monitor_target' , 'global' ),
  $puppi               = params_lookup( 'puppi' , 'global' ),
  $puppi_helper        = params_lookup( 'puppi_helper' , 'global' ),
  $firewall            = params_lookup( 'firewall' , 'global' ),
  $firewall_tool       = params_lookup( 'firewall_tool' , 'global' ),
  $firewall_src        = params_lookup( 'firewall_src' , 'global' ),
  $firewall_dst        = params_lookup( 'firewall_dst' , 'global' ),
  $debug               = params_lookup( 'debug' , 'global' ),
  $audit_only          = params_lookup( 'audit_only' , 'global' ),
  $package             = params_lookup( 'package' ),
  $service             = params_lookup( 'service' ),
  $service_status      = params_lookup( 'service_status' ),
  $process             = params_lookup( 'process' ),
  $process_args        = params_lookup( 'process_args' ),
  $process_user        = params_lookup( 'process_user' ),
  $config_dir          = params_lookup( 'config_dir' ),
  $config_file         = params_lookup( 'config_file' ),
  $config_file_mode    = params_lookup( 'config_file_mode' ),
  $config_file_owner   = params_lookup( 'config_file_owner' ),
  $config_file_group   = params_lookup( 'config_file_group' ),
  $config_file_init    = params_lookup( 'config_file_init' ),
  $pid_file            = params_lookup( 'pid_file' ),
  $data_dir            = params_lookup( 'data_dir' ),
  $log_dir             = params_lookup( 'log_dir' ),
  $log_file            = params_lookup( 'log_file' ),
  $port                = params_lookup( 'port' ),
  $protocol            = params_lookup( 'protocol' )
  ) inherits ldap::params {

  $bool_source_dir_purge=any2bool($source_dir_purge)
  $bool_service_autorestart=any2bool($service_autorestart)
  $bool_absent=any2bool($absent)
  $bool_disable=any2bool($disable)
  $bool_disableboot=any2bool($disableboot)
  $bool_monitor=any2bool($monitor)
  $bool_puppi=any2bool($puppi)
  $bool_firewall=any2bool($firewall)
  $bool_debug=any2bool($debug)
  $bool_audit_only=any2bool($audit_only)

  ### Definition of some variables used in the module
  $manage_package = $ldap::bool_absent ? {
    true  => 'absent',
    false => $ldap::version,
  }

  $manage_service_enable = $ldap::bool_disableboot ? {
    true    => false,
    default => $ldap::bool_disable ? {
      true    => false,
      default => $ldap::bool_absent ? {
        true  => false,
        false => true,
      },
    },
  }

  $manage_service_ensure = $ldap::bool_disable ? {
    true    => 'stopped',
    default =>  $ldap::bool_absent ? {
      true    => 'stopped',
      default => 'running',
    },
  }

  $manage_service_autorestart = $ldap::bool_service_autorestart ? {
    true    => Service[nscd],
    false   => undef,
  }

  $manage_file = $ldap::bool_absent ? {
    true    => 'absent',
    default => 'present',
  }

  if $ldap::bool_absent == true
  or $ldap::bool_disable == true
  or $ldap::bool_disableboot == true {
    $manage_monitor = false
  } else {
    $manage_monitor = true
  }

  if $ldap::bool_absent == true
  or $ldap::bool_disable == true {
    $manage_firewall = false
  } else {
    $manage_firewall = true
  }

  $manage_audit = $ldap::bool_audit_only ? {
    true  => 'all',
    false => undef,
  }

  $manage_file_replace = $ldap::bool_audit_only ? {
    true  => false,
    false => true,
  }

  $manage_file_source = $ldap::source ? {
    ''        => undef,
    default   => $ldap::source,
  }

  $manage_file_content = $ldap::template ? {
    ''        => undef,
    default   => template($ldap::template),
  }

  include ldap::install
  include ldap::config

  ### Include custom class if $my_class is set
  if $ldap::my_class {
    include $ldap::my_class
  }


  ### Provide puppi data, if enabled ( puppi => true )
  if $ldap::bool_puppi == true {
    $classvars=get_class_args()
    puppi::ze { 'ldap':
      ensure    => $ldap::manage_file,
      variables => $classvars,
      helper    => $ldap::puppi_helper,
    }
  }


  ### Service monitoring, if enabled ( monitor => true )
  if $ldap::bool_monitor == true {
    monitor::port { "ldap_${ldap::protocol}_${ldap::port}":
      protocol => $ldap::protocol,
      port     => $ldap::port,
      target   => $ldap::monitor_target,
      tool     => $ldap::monitor_tool,
      enable   => $ldap::manage_monitor,
    }
    monitor::process { 'ldap_process':
      process  => $ldap::process,
      service  => $ldap::service,
      pidfile  => $ldap::pid_file,
      user     => $ldap::process_user,
      argument => $ldap::process_args,
      tool     => $ldap::monitor_tool,
      enable   => $ldap::manage_monitor,
    }
  }


  ### Firewall management, if enabled ( firewall => true )
  if $ldap::bool_firewall == true {
    firewall { "ldap_${ldap::protocol}_${ldap::port}":
      source      => $ldap::firewall_src,
      destination => $ldap::firewall_dst,
      protocol    => $ldap::protocol,
      port        => $ldap::port,
      action      => 'allow',
      direction   => 'input',
      tool        => $ldap::firewall_tool,
      enable      => $ldap::manage_firewall,
    }
  }


  ### Debugging, if enabled ( debug => true )
  if $ldap::bool_debug == true {
    file { 'debug_ldap':
      ensure  => $ldap::manage_file,
      path    => "${settings::vardir}/debug-ldap",
      mode    => '0640',
      owner   => 'root',
      group   => 'root',
      content => inline_template('<%= scope.to_hash.reject { |k,v| k.to_s =~ /(uptime.*|path|timestamp|free|.*password.*|.*psk.*|.*key)/ }.to_yaml %>'),
    }
  }
}

