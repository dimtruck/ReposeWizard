require 'sinatra'

get '/get_versions' do
  "Retrieves a list of versions from redis"
end

post '/set_version' do
  "Sets version for this session"
end

get '/get_filters_for_version' do
  "Gets all filters for version"
end

post '/add_filter' do
  "Add filter for this session"
end

get '/get_data_for_filter' do
  "Get attributes for filter"
end

put '/save_data_for_filter' do
  "Save data for filter"
end

put '/upload_file_for_attribute_for_filter' do
  "Uploads xsd file for attr for filter"
end

post '/update_dd' do
  "Updates config with dist-datastore filter if needed"
end

get '/spin_up_repose' do
  "Spins up repose with configurations that are set up for this session and returns specific link to the running instance for testing"
end

post '/execute_request' do
  "Passes the request to the running instance.  Collects all data and returns to client"
end

post '/run_benchmark' do
  "Runs benchmark with passed request.  Collects all data and returns to client (as well as the diff between direct request to client and through repose)"
end

get '/download_config' do
  "Retrieve generated configuration and next steps to set up for this version"
end

post '/upload_configuration' do
  "Upload configuration for this session"
end
