
# Install build-essentials
#
include_recipe "build-essential::default"

# Install packages from attributes
#
node[:common][:packages].each do |name, hash|
  hash =  case hash
          when true then { "action" => "install" }
          when false then { "action" => "remove" }
          else hash.respond_to?(:to_hash) ? hash.to_hash : hash
          end

  compile_time = hash.delete("compile_time")

  r = package name
  r.load_properties(hash)

  if compile_time
    r.action :nothing
    r.run_action(hash["action"] || :install)
  end
end

# Install gems from attributes
#
node[:common][:gems].each do |name, hash|
  hash =  case hash
          when true then { "action" => "install" }
          when false then { "action" => "remove" }
          else hash.respond_to?(:to_hash) ? hash.to_hash : hash
          end

  compile_time = hash.delete("compile_time")

  r = gem_package(name)
  r.load_properties(hash)

  if compile_time
    r.action :nothing
    r.run_action(hash["action"] || :install)
  end
end

# Install chef_gems from attributes
#
node[:common][:chef_gems].each do |name, hash|
  hash =  case hash
          when true then { "action" => "install" }
          when false then { "action" => "remove" }
          else hash.respond_to?(:to_hash) ? hash.to_hash : hash
          end

  chef_gem name do
    load_properties hash
  end
end

