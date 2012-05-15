schemadir = "/etc/ldap/schema"

Puppet::Type.type(:ldapschema).provide(:fgtools, :parent => 
Puppet::Provider::File, :schema_directory 
=> schemadir)  do
    desc "Default provider using the slapd tools built in to the LDAP module."

    commands :slapd-add-schema => "/usr/sbin/slapd-add-schema"
    commands :slapd-del-schema => "/usr/sbin/slapd-del-schema"
    commands :slapd-chk-schema => "/usr/sbin/slapd-chk-schema"

    defaultfor :slapdtools => :fgtools

    def create
        slapd-add-schema, resource[:name], resource[:path]
    end

    def destroy
        slapd-del-schema, resource[:name]
    end

    def exists?
        slapd-chk-schema, resource[:name]
    end

end
