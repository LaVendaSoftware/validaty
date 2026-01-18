GEM_TO_PUSH = `ls validaty*.gem | tail -n 1`

build:
	gem build validaty.gemspec

publish:
	@echo "gem push ${GEM_TO_PUSH}"
	@gem push ${GEM_TO_PUSH}

ci:
	make rubocop rspec

rspec:
	bin/rspec

rubocop:
	bin/rubocop

rubocop-fix:
	bin/rubocop -A
