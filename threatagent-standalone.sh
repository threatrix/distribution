if [ -f "Gemfile" ]; then
        echo "Installing CycloneDX for Ruby Gems.."
        if ! command -v gem &> /dev/null
        then
                echo "rubygems not installed. Please install ruby-full and rubygems and try again."
                exit
        fi
        gem install cyclonedx-ruby
fi
if [ -f "mix.exs" ]; then
        echo "Installing CycloneDX for Mix.."
        if ! command -v mix &> /dev/null
        then
                echo "mix not installed. Please install mix and try again."
                exit
        fi
        mix archive.install hex sbom --force
fi
echo "Downloading Threatrix Threat Agent.."
curl -L https://github.com/threatrix/threat-matrix/releases/download/v1.2.9-RELEASE/threat-agent-1.2.9.6.jar -o threat-agent.jar
