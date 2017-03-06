file '/etc/yum.repos.d/ATrpms.repo' do
  owner 'root'
  group 'root'
  mode '644'
  content <<-EOC
[atrpms]
name=Fedora Core $releasever - $basearch - ATrpms
baseurl=http://dl.atrpms.net/el$releasever-$basearch/atrpms/stable
gpgkey=http://ATrpms.net/RPM-GPG-KEY.atrpms
gpgcheck=1
EOC
  action :create
end
