#region HEADER
# --------------------------------------------------------------------  
# Desc     :  Configure FW Inbound Rules
# Contact  :  @julianrosbcn
# Comments :  Based in server role
# --------------------------------------------------------------------
#endregion HEADER




Configuration DSCSettings
{	
	Import-DscResource -ModuleName  xPSDesiredStateConfiguration
	Import-DSCResource -ModuleName  xNetworking 

	
	Node $AllNodes.where{$_.Role -eq "web"}.NodeName
	{
		xFirewall fwWebSite1
        	{ 
            		Direction = "Inbound" 
            		Name = "WebSite1 Inbound" 
            		DisplayName = "Web Server (TCP-In)" 
           		Description = "WebSite1 Inbound" 
            		Group = "IIS Inbound Traffic" 
            		Enabled = "True" 
            		Protocol = "TCP" 
            		LocalPort = "443" 
            		Ensure = "present" 
        	}
		
		xFirewall fwWebSite2
        	{ 
           		Direction = "Inbound" 
            		Name = "WebSite2 Inbound" 
            		DisplayName = "Web Server (TCP-In)" 
            		Description = "WebSite2 Inbound" 
            		Group = "IIS Inbound Traffic" 
            		Enabled = "True" 
            		Protocol = "TCP" 
            		LocalPort = "4433" 
            		Ensure = "present" 
        	}
	}
	
	Node $AllNodes.where{$_.Role -eq "sql"}.NodeName
	{
		xFirewall fwSQLServer
        	{ 
            		Direction = "Inbound" 
            		Name = "SQLServer Inbound" 
            		DisplayName = "SQL Server (TCP-In)" 
            		Description = "SQL Server Inbound" 
            		Group = "SQLServer Inbound Traffic" 
            		Enabled = "True" 
            		Protocol = "TCP" 
            		LocalPort = "1433" 
            		Ensure = "present" 
        	}
	}

}