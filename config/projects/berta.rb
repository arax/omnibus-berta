name 'berta'
maintainer 'Boris Parak <parak@cesnet.cz>'
homepage 'https://github.com/the-berta-project/berta'
description 'Tool enforcing a pre-set expiration date on VMs in an OpenNebula-based cloud.'

install_dir     '/opt/berta'
build_version   "2.0.1"
build_iteration 1

override :rubygems, :version => '2.6.8'
## WARN: do not forget to change RUBY_VERSION in the postinst script
##       when switching to a new minor version
override :ruby, :version => '2.4.2'

# creates required build directories
dependency 'preparation'

# berta dependencies/components
dependency 'berta'

# version manifest file
dependency 'version-manifest'

# tweaking package-specific options
package :deb do
  vendor 'CESNET, Grid Department <cloud@metacentrum.cz>'
  license 'Apache License, Version 2.0'
  priority 'extra'
  section 'net'
end

package :rpm do
  vendor 'CESNET, Grid Department <cloud@metacentrum.cz>'
  license 'Apache License, Version 2.0'
  category 'Applications/System'
end

exclude '\.git*'
exclude 'bundler\/git'
