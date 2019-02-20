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
        }	
		@{
			NodeName = "frontendServer"
			Role = "web"
		}
		@{
			NodeName = "midwareServer"
			Role = "app"
		}
		@{
			NodeName = "backendServer"
			Role = "sql"			
		}
	)

}