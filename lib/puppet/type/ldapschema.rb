require 'fileutils'

Puppet::Type.newtype(:ldapschema) do
    @doc = "Manage LDAP schemas in a database configuration style."

    ensurable

    newparam(:name) do
        desc "The name of the schema"

        isnamevar
    end

    # this parameter needs a lot of work, we want to eventually always use a tempfile and allow for source to behave as file.source
    newparam(:source) do
        desc "The schema source"
    end

    newparam(:path) do
        desc "The path to the schema directory"

        @resource.class.defaultprovider.ancestors.include?
        (Puppet::Provider::ParsedFile)
            @resource.class.defaultprovider.schema_directory
        else
            nil
        end
    end

end
