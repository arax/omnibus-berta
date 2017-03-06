project_name = 'berta'
home_dir = '/home/vagrant'
work_dir = "#{home_dir}/#{project_name}"
build_env = { "HOME" => home_dir }

bash 'run_omnibus_build' do
  user 'vagrant'
  group 'omnibus'
  environment build_env

  platform_string = "#{node[:platform]}-#{node[:platform_version]}"
  pkg_dir = "#{work_dir}/packages/#{platform_string}"
  cwd work_dir
  timeout 7200

  code <<-EOC
    source /home/#{user}/load-omnibus-toolchain.sh
    bundle install --binstubs --path vendor/bundle-#{platform_string}
    bundle exec omnibus build #{project_name}

    if [ $? -eq 0 ]; then
      mkdir -p #{pkg_dir}
      cp #{work_dir}/pkg/* #{pkg_dir}
      rm -r #{work_dir}/pkg
      rm -r #{work_dir}/.bundle
      rm -r #{work_dir}/vendor/bundle-#{platform_string}
    else
      exit 125
    fi
  EOC
end
