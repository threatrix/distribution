if [ -f "Gemfile" ]; then
        echo "Installing CycloneDX for Ruby Gems.."
        if ! command -v gem &> /dev/null
        then
                echo "[warning] rubygems may not be installed."
                #exit
        fi
        gem install cyclonedx-ruby
fi
if [ -f "mix.exs" ]; then
        echo "Installing CycloneDX for Mix.."
        if ! command -v mix &> /dev/null
        then
                echo "[warning] mix may not be installed."
        fi
        mix archive.install hex sbom --force
fi
if [ -f "package.json" ]; then
        if ! command -v npm &> /dev/null
        then
                echo "[warning] npm may not be installed."
        fi
fi

printenv | grep CODEBUILD

echo "Downloading Threatrix Threat Agent.."
curl -SsL https://github.com/threatrix/threat-matrix/releases/download/v1.2.9-RELEASE/threat-agent-1.2.9.6.jar -o threat-agent.jar
