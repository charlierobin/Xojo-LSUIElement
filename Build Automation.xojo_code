#tag BuildAutomation
			Begin BuildStepList Linux
				Begin BuildProjectStep Build
				End
			End
			Begin BuildStepList Mac OS X
				Begin BuildProjectStep Build
				End
				Begin IDEScriptBuildStep ScriptSetLSUIElement , AppliesTo = 0, Architecture = 0
					var path as String = CurrentBuildLocation + "/" + CurrentBuildAppName.ReplaceAll( " ", "\ " )
					
					var result as String = DoShellCommand( "/usr/libexec/PlistBuddy -c ""Add :LSUIElement bool true"" " + path + ".app/Contents/Info.plist" )
					
					if result <> "" then print( result )
					
					
				End
			End
			Begin BuildStepList Windows
				Begin BuildProjectStep Build
				End
			End
#tag EndBuildAutomation
