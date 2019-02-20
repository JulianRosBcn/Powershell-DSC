#region HEADER
# --------------------------------------------------------------------  
# Desc     :  ConfigData to be processed during compilation
# Contact  :  @julianrosbcn
# Comments :  All nodes properties applies to all nodes detailed below
@			  
# --------------------------------------------------------------------
#endregion HEADER
 
$configdata = @{

	AllNodes = @(
		@{
        	NodeName = "*"
			OctopusAPIKey = "insert_api_key_here"
			OctopusServerUrl = "insert_url_here"
        }	
		@{
			NodeName = "frontendServer"
			Role = "web"
			Environment = "prod"
			tenant = "customerA"
		}
		@{
			NodeName = "backendServer"
			Role = "sql"			
			Environment = "prod"
			tenant = "customerA"
		}
	)

}