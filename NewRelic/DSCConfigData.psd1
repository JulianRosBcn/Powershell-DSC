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
			NodeName = "prodServer"
			Environment = "prod"
		}
		@{
			NodeName = "devServer"
			Environment = "dev"
		}
		@{
			NodeName = "testServer"
			Environment = "test"
		}
	)

}