require 'sinatra'
require 'json'
require './Step.rb'
require './Models/Version.rb'

def valid_json? json_
  JSON.parse(json_)
  return true
rescue JSON::ParserError
  return false
end

configure :production, :development do
  enable :sessions
  set :session_secret, 'OIHOHsfh@%h3fHk3#%H'
end

configure :development do
  enable :logging
end

get '/' do
  erb :index
end

get '/get_versions' do
  content_type :json
  model = Models::Version.new
  body model.get_versions_available_for_new_build.to_json  
end

get '/get_filters/:version' do |version|
  content_type :json
  filters = [
    {'id'=>'1', 'english'=>'Rate limit traffic to my app','filter_list'=>'rate-limiting','description'=>'this is a way to throttle traffic coming into my application.'},
    {'id'=>'2', 'english'=>'Authenticate my app with a 3rd party Auth provider','filter_list'=>'client-auth','description'=>'Repose will authenticate every matching request against a third party authentication provider prior to allowing requests come into your application'}
  ]
  body filters.to_json
end

get '/get_data_for_filter/:filters' do |filters|
  filter_array = filters.split(",")
  content_type :json
  details = [
    {
      'id' => '1', 
      'filter' => 'client-auth-n',
      'template' => 'clientAuthTemplate', 
      'configs' => [
          {
            'id' => '1', 
            'parent' => '0', 
            'key' => 'auth-filter-module', 
            'description' => 'Select auth filter module', 
            'type' => 'select', 
            'value' => [
                {'id' => '2', 'parent' => '1', 'key' => 'http-basic-auth','value' => 'http basic auth', 'action' => '/load_config_children/2'},
                {'id' => '3', 'parent' => '1', 'key' => 'openstack-auth','value' => 'OpenStack Identity Service authentication', 'action' => '/load_config_children/3'},
                {'id' => '4', 'parent' => '1', 'key' => 'rackspace-auth','value' => 'Rackspace Cloud Auth version 1.1', 'action' => '/load_config_children/4'}
            ], 
            'default' => '2',
            'min' => '1', 
            'max' => '1'
          }, 
          {
            'id' => '5', 
            'parent' => '0', 
            'key' => 'white-list', 
            'description' => 'A list of uri patterns all users can access.', 
            'type' => 'text', 
            'value' => '*', 
            'min' => '0', 
            'max' => 'unlimited'
          }
       ]
    },
    {
       'id' => '2', 
       'filter' => 'rate-limiting', 
       'template' => 'rateLimitingTemplate',
       'configs' => [

       ]
    }
  ]
  body details.to_json
end

get '/load_config_children/:config_id' do |config_id|
  if config_id === '2' then
    config = {
      'template' => 'basicAuthTemplate',
      'detail' => 
       {
        'username' => '',
        'password' => '' 
      }
    } 
  elsif config_id === '3' then
    config = {
      'template' => 'openstackAuthTemplate',
      'detail' => 
       {
         'service' => {
           'username' => '',
           'password' => '',
           'uri' => '',
           'tenant_id' => ''
         },
         'header' => {
           'isSelected' => false,
           'format' => 'JSON',
           'cache-timeout' => '600000',
           'format_enumerations' => ['JSON','XML']
         },
         'client_mappings' => [],
         'delegable' => false,
         'user_cache_timeout' => '60000',
         'token_cache_timeout' => '600000',
         'tenanted' => true,
         'request_groups' => true
      }
    } 
  end

  content_type :json
  body config.to_json
end

get '/get_test_environment' do
  content_type :json
  guid = {'id' => '2345-2385-23859'}
  body guid.to_json
end

post '/execute_request/:guid' do |guid|
  # set up directory
  response = {
    'request_from_client' => {
      'request_uri' => 'test',
      'request_method' => 'GET',
      'request_headers' => [],
      'request_data' => ''
    },
    'repose_flow' => [
      {
        'id' => 1,
        'type' => 'request',
        'request_uri' => 'to_auth',
        'request_method' => 'GET',
        'request_headers' => [],
        'request_data' => ''
      },
      {
        'id' => 2,
        'type' => 'response',
        'response_time' => 53,
        'response_headers' => [],
        'response_data' => 'blahbalh'
      },
      {
        'id' => 3,
        'type' => 'request',
        'request_uri' => 'to_origin',
        'request_method' => 'GET',
        'request_headers' => [],
        'request_data' => ''
      },
      {
        'id' => 4,
        'type' => 'response',
        'response_time' => 63,
        'response_headers' => [],
        'response_data' => 'blahbalh'
      }
    ],
    'response_to_client' => {
      'response_time' => 563,
      'response_headers' => [{'data' => 'accept: application/xml'}],
      'response_data' => 'blahbalh'
    }
  }

  content_type :json
  body response.to_json
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
