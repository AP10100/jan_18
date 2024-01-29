if ("${params.ENVIRONMENT}" == "qa") {
							echo "Release for qa environment"
								if ("${params.VERSION_INCREMENT}" == "No Change") {
									echo "No Change let's release existing version"
									def current_rc_tag = sh(script: 'git describe --tags --match "*rc*" --abbrev=0', returnStdout: true).trim()
									echo "Current RC Tag: ${current_rc_tag}"
									def tag_name = "$current_rc_tag"
									echo "Tag created: $tag_name"
								}
								else {
									echo "let's release ${params.VERSION_INCREMENT} version"
									sh "release-it ${params.VERSION_INCREMENT} --preRelease=rc --ci"
									def tag_name = sh(script: 'git describe --tags --match "*rc*" --abbrev=0', returnStdout: true).trim()
									echo "Tag created: $tag_name"
								}
							}



            if ("${params.ENVIRONMENT}" == "qa") {
                if ("${params.VERSION_INCREMENT}" == "No Change") {
                    echo "No Change, let's release the existing RC version"
                    def current_rc_tag = sh(script: 'git describe --tags --match "*rc*" --abbrev=0', returnStdout: true).trim()
                    echo "Current RC Tag: ${current_rc_tag}"
                    def tag_name = "$current_rc_tag"
                    echo "Tag created: $tag_name"
                } else {
                    echo "Let's increment the RC version"
                    def current_rc_tag = sh(script: 'git describe --tags --match "*rc*" --abbrev=0', returnStdout: true).trim()
                    echo "Current RC Tag: ${current_rc_tag}"
                    
                    // Extract the current RC version
                    def current_rc_version = current_rc_tag =~ /(\d+\.\d+\.\d+-rc\.)(\d+)/
                    def rc_version_prefix = current_rc_version[0][1]
                    def rc_version_number = current_rc_version[0][2] as Integer
                    
                    // Increment the RC version
                    rc_version_number++
                    def new_rc_version = "${rc_version_prefix}${rc_version_number}"
                    
                    echo "Next RC Version: ${new_rc_version}"
                    
                    // Use the new RC version in subsequent steps
                    def tag_name = new_rc_version
                    echo "Tag created: $tag_name"
                }
            }
        
                            