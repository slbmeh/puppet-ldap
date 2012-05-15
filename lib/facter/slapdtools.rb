# Default to "builtin" tools for standard provider.
#   Future providers should override this fact with has_weight
#   and properly chech for their tools distribution.
Facter.add(:slapdtools) do
  setcode do
    "fgtools"
  end
end
