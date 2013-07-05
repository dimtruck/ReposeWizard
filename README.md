##Repose Wizard##
**Step 1: Whatcha wanna do?**

	* option 1: build a repose configuration
	* option 2: test my configuration

**OPTION 1:**

	**Step 2: Select your Repose version (2.8.0 is the only option right now)**
	
	**Step 3: What do you want Repose to do?**
		* [filter] English name -- e.g. [rate-limiting filter] Rate Limit my app
		* [auth-n filter] Authenticate my app with 3rd party Auth provider
		* [auth-z filter] Authorize my app with 3rd party Auth provider
		* [transform filter] Transform requests to my app from client and vice versa
		* [validator filter] Validate incoming requests to my app against roles
		* [compression filter] Compress and/or decompress incoming requests to my app and vice versa
		* [ip-identity filter] Whitelist or blacklist various ip addresses
		* [normalization filter] Add and/or remove incoming headers

	**Step 4: You're going to need provide some details to make Repose work!**
		* for rate-limiting
			- add groups with regex (add a regex tester)
			- show default values for attributes but allow users to update
		* for auth-n and auth-z
			- user and password
			- allow to test for "success" - note that if on public cloud, warn client that s/he should setup on an internal site (download setup instructions from GitHub)
		* for transform
			- add xsd
		* for validator
			- add roles and methods and uri's
		* for compression
		
	**Step 4: How many nodes do you want to spin up?**
		* adds [dist-datastore for anything over 1]
	
	**Step 5: Test Drive!!**
		* spin up repose valve with configuration setup - add log4j DEBUG and jetty logging and client-request-logging true.  Also add header to trace request
		* on requests, show requests, all logs for request/response are outputted to the client
		* benchmark option (runs apache benchmark with configuration and shows difference between calling directly to origin service)
	
	**Step 6: Happy?  Download!**
		* provide zip link to download configuration files
		* provide next steps for setup as valve/war
		
**OPTION 2:**

	**Step 2: Upload your configuration here!**
		* validate that it's valid XML files (using Repose)
		* add to etc/repose directory
		* spin up Repose with configurations
	
	**Step 3: Test Drive!!**
		* spin up repose valve with configuration setup - add log4j DEBUG and jetty logging and client-request-logging true.  Also add header to trace request
		* on requests, show requests, all logs for request/response are outputted to the client
		* benchmark option (runs apache benchmark with configuration and shows difference between calling directly to origin service)
