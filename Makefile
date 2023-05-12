SHELL := /bin/zsh

# Define message length
MESSAGE_LENGTH := 50

#Ruby RN 0.70.5
RUBY_VERSION := 2.7.5

#Node version
NODE_VERSION := 18.16.0

#Applications
APPLICATIONS := "Sourcetree" "Android Studio" "Android File Transfer" "Google Chrome" "RunCat" "Xcode-14.3.0" "Visual Studio Code" "Postman" "IntelliJ IDEA CE" "Slack";

install: set-xcode-cli set-brew
	sudo -v
	brew update
	brew bundle --file=Brewfile --verbose
	
	@make set-xcode
	@make set-rbenv
	@make set-nvm
	@make set-android
	@make set-rosetta
	@make set-applications

set-xcode-cli:
	$(call check_install,\
	xcode-select,\
	Xcode CLI,\
	xcode-select --install\
	)

set-brew:
	$(call check_install,\
	brew,\
	Homebrew,\
	/bin/bash -c \
	"$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"\
	)

	@echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
	echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"'


set-applications:
	@for application in $(APPLICATIONS) do \
		open /Applications/$$application.app;\
	done

set-xcode:
	@xcodes install 14.3 --experimental-unxip

set-rbenv:
	$(call execute_commands, rbenv setting, $(commands-rbenv))

set-nvm:
	$(call execute_commands, nvm setting, $(commands-nvm))

set-rosetta:
	$(call execute_commands, rosetta setting, $(commands-rosetta))

set-android:
	@make set-android-path

set-android-path:
	$(call execute_commands, android path setting, $(commands-android-path))

cleanup:
	brew bundle cleanup --force --file=Brewfile_fez_taap

# Define commands to install and setting environments

commands-android-path := \
	echo '\nexport ANDROID_HOME=$$HOME/Library/Android/sdk' \
		>> ~/.zshrc && \
	echo 'export PATH=$$PATH:$$ANDROID_HOME/emulator' \
		>> ~/.zshrc && \
	echo 'export PATH=$$PATH:$$ANDROID_HOME/platform-tools\n' \
		>> ~/.zshrc

commands-brew-path := \
	echo 'eval "$$(/opt/homebrew/bin/brew shellenv)"\n' \
		>> ~/.zprofile

commands-rbenv := \
	echo -n 'eval "$$(rbenv init - zsh)"\n' >> ~/.zshrc && \
	rbenv install $(RUBY_VERSION) && \
	rbenv global $(RUBY_VERSION)

commands-nvm := \
	mkdir ~/.nvm && \
	echo '\nexport NVM_DIR="$$HOME/.nvm"' >> ~/.zshrc && \
	echo '\# This loads nvm' >> ~/.zshrc && \
	echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc && \
	echo '\# This loads nvm bash_completion' >> ~/.zshrc && \
	echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"'	>> ~/.zshrc && \
	nvm install $(NODE_VERSION) && \
	nvm alias system $(NODE_VERSION)
				
commands-rosetta := \
	/usr/sbin/softwareupdate --install-rosetta --agree-to-license;


# Define print message function
define print_message
	@len=$$(echo -n "$(1)" | wc -c | tr -d '[:space:]'); \
	if [[ $$len -gt $(MESSAGE_LENGTH) ]]; then \
		printf "\033[31m[ERROR] Message length is too long (max: $(MESSAGE_LENGTH))\033[0m\n"; \
	else \
		padding=$$(for i in $$(seq 1 $$((($(MESSAGE_LENGTH) - $$len) / 2)) ); do echo -n '='; done); \
		printf "\033[36m===%s %s %s===\033[0m\n" "$$padding" "$(1)" "$$padding"; \
	fi
endef

# Define function to check if command is installed and print message
define check_install
	@if command -v $(1) > /dev/null; then \
		printf "$(2) already installed\n"; \
	else \
		$(3); \
	fi
endef

# Define function to execute commands and print start/end messages
define execute_commands
	$(call print_message, '$(1) Start!')
	$(2)
	$(call print_message, '$(1) End!')
endef

.PHONY: install cleanup set-rbenv set-nvm set-android set-rosetta set-applications set-xcode