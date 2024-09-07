server 'your-safety', user: 'deploy', roles: %w{app db web}

set :ssh_options, { forward_agent: true }