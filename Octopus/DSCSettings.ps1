#region HEADER
# --------------------------------------------------------------------  
# Desc     :  Configure Octopus deployment agents and configure / register in the deployment platform
# Contact  :  @julianrosbcn
# Comments :  Based in env, role and tenant. Configured in 10443 pull mode
# -------------------------------------------------------------------
#endregion HEADER




Configuration DSCSettings
{	
	Import-DscResource -ModuleName  xPSDesiredStateConfiguration
	Import-DSCResource -ModuleName  OctopusDSC 

	
	Node $AllNodes.nodename
	{	
		$Environments = @($Node.Environment.ToUpper())
		$roles = @($Node.Role.ToUpper())	
		$tenants = @($Node.tenant.ToUpper())
		
		$ServerURL = $Node.OctopusServerUrl
		$Listenport = "10943" 
		$APIKey = $Node.OctopusAPIKey
		$DefaultApplicationDirectory = "C:\Octopus\Applications"
		$DefaultTentacleHomeDirectory = "C:\Octopus"
		
		Ctentacleagent octopustentacle
        {
            Ensure = "present"
            state = "started"
            name = "Azure"
 
            # Registration - all parameters required
            apikey = $APIKey
            OctopusServerUrl = $ServerURL
            environments = $environments
            roles = $roles
            tenants = $tenants
            
            # Optional settings
            ServerPort = $Listenport
            defaultapplicationdirectory = $DefaultApplicationDirectory
            CommunicationMode =  "Poll"
            TentacleHomeDirectory = $DefaultTentacleHomeDirectory
        }

}