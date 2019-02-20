#region HEADER
# --------------------------------------------------------------------  
# Desc     :  Configure features in every VM based in server role
# Contact  :  @julianrosbcn
# Comments :  Based in role web or sql, and global requirements (i.example telnet for connectivity checks)
#			  Adding IIS Features to web and app servers and extra to SQL. Telnet feature installed everywhere
# -------------------------------------------------------------------
#endregion HEADER




Configuration DSCSettings
{	
	Import-DscResource -ModuleName  xPSDesiredStateConfiguration

	
	Node $AllNodes.where{$_.Role -eq "web" -or $_.Role -eq "app"}.NodeName
	{
		$features = @('NET-Framework-Core'
					,'NET-Non-HTTP-Activ'
					,'NET-Framework-45-Core'
					,'NET-Framework-45-ASPNET'
					,'NET-WCF-Services45'
					,'NET-WCF-HTTP-Activation45'
					,'NET-WCF-TCP-PortSharing45'
					,'Web-Http-Errors'
					,'Web-Static-Content'
					,'Web-Http-Redirect'
					,'Web-Asp-Net'
					,'Web-Asp-Net45'
					,'Web-Net-Ext'
					,'Web-Net-Ext45'
					,'Web-Log-Libraries'
					,'Web-Http-Tracing'
					,'Web-Custom-Logging'
					,'Windows-Identity-Foundation'
					,'Web-Http-Logging'
					,'Web-Windows-Auth'
					,'Web-Basic-Auth'
					,'Web-Filtering'
					,'Web-Mgmt-Console'
		)
		
		foreach ($feature in $features)
		{	
			WindowsFeature $feature
			{
				Name = $feature
				Ensure = "present"
			}
		}
	}
	
	Node $AllNodes.where{$_.Role -eq "sql"}.NodeName
	{
		$features = @('RSAT','MSMQ','GPMC','RSAT-DNS-Server')
		
		foreach ($feature in $features)
		{	
			WindowsFeature $feature
			{
				Name = $feature
				Ensure = "present"
			}
		}
	}
	
	Node $AllNodes.NodeName
	{
		$features = @('telnet-client')
		
		foreach ($feature in $features)
		{	
			WindowsFeature $feature
			{
				Name = $feature
				Ensure = "present"
			}
		}
	}
}