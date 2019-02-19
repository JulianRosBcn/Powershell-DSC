#region HEADER
# --------------------------------------------------------------------  
# Desc     :  Install NR Agents APM and Infrastructure with DSC
# Contact  :  @julianrosbcn
# Comments :  Fully automated. Agents will start reporting after harvesting starts in some minutes after DSC is applies
# --------------------------------------------------------------------
#endregion HEADER




Configuration DSCSettings
{	
	Import-DscResource -ModuleName  xPSDesiredStateConfiguration


#region NewRelic Infrastructure Agent

	 Node $AllNodes.where{$_.Environment -eq "prod"}.NodeName
	 {
		$NRInfraAgentPackageLocalPath = "$($env:temp)\newrelic-infra.msi"
		
	 	Service NRInfraAgent
         	{
             		Name = "newrelic-infra"
             		State = "Running"
             		DependsOn = "[Package]NRInfraAgent"
        	}

         	xRemoteFile NRInfraAgentPackage {
            		Uri = "https://download.newrelic.com/infrastructure_agent/windows/newrelic-infra.msi"
             		DestinationPath = $NRInfraAgentPackageLocalPath
         	}
		 
         	Package NRInfraAgent {
             		Ensure = "present"
             		Path  = $NRInfraAgentPackageLocalPath
             		Name = "New Relic Infrastructure Agent"
             		ProductId = ""
             		Arguments = 'GENERATE_CONFIG="true" LICENSE_KEY="insert_your_apiKey_here"'
             		DependsOn = "[xRemoteFile]NRInfraAgentPackage"
         	}
	 }
		
#endregion
 
#region NewRelic APM Agent
	 
	 Node $AllNodes.where{$_.Environment -eq "prod"}.NodeName
	 {

		$NRDotNetAgentPackageLocalPath = "$($env:temp)\NewRelicDotNetAgent_x64.msi"

    		xRemoteFile NRDotNetAgentPackage {
             		Uri = "https://download.newrelic.com/dot_net_agent/latest_release/NewRelicDotNetAgent_x64.msi"
            		DestinationPath = $NRDotNetAgentPackageLocalPath
         	}
		 
         	Package NRDotNetAgent {
             		Ensure = "Present"
             		Path  = $NRDotNetAgentPackageLocalPath
             		Name = "New Relic .NET Agent (64-bit)"
             		ProductId = ""
             		DependsOn = "[xRemoteFile]NRDotNetAgentPackage"
        	}
	 }

#endregion


}