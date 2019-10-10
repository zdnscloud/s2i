.PHONY: deploy
book:
	mdbook build

deploy: book
	@echo "====> deploying to github"
	-git worktree add -f /tmp/book gh-pages
	rm -rf /tmp/book/*
	cp -rp book/* /tmp/book/
	cd /tmp/book && \
		git add -A && \
		git commit -m "deployed on $(shell date) by $(shell git config user.name)" && \
		git push -f origin gh-pages

