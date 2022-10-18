DEBIAN_FRONTEND=noninteractive apt-get -y install locales
sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
LANG=en_US.UTF-8
LANGUAGE=en_US:en
LC_ALL=en_US.UTF-8

apt-get update -y
apt-get install esl-erlang -y
apt-get install elixir -y
sudo apt-get install erlang-xmerl -y
mix local.hex --force
mix local.rebar --force


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
echo "Downloading Threatrix Threat Agent.."
curl -SsL https://github.com/threatrix/threat-matrix/releases/download/v1.2.9-RELEASE/threat-agent-1.2.9.6.jar -o threat-agent.jar
