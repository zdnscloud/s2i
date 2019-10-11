.PHONY: deploy
book:
	mdbook build

deploy: book
	@echo "====> deploying to github"
	-git worktree add -f /tmp/s2i-docs gh-pages
	rm -rf /tmp/s2i-docs/*
	cp -rp book/* /tmp/s2i-docs/
	cd /tmp/s2i-docs && \
		git add -A && \
		git commit -m "deployed on $(shell date) by $(shell git config user.name)" && \
		git push -f origin gh-pages

