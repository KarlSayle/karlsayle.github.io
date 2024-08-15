# Makefile

# Command to create a new post file
post:
	@echo "Creating a new post..."
	@if [ -z "$(TITLE)" ]; then \
		echo "Error: TITLE is required."; \
		exit 1; \
	fi; \
	filename=$$(echo "$(TITLE)" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-z0-9]\+/-/g' | sed 's/^-//' | sed 's/-$$//'); \
	date=$$(date +%Y-%m-%d); \
	fullname="_posts/$${date}-$${filename}.md"; \
	mkdir -p "_posts"; \
	if [ ! -f "_template.md" ]; then \
		echo "Error: _template.md file not found."; \
		exit 1; \
	fi; \
	local_datetime=$$(date '+%Y-%m-%d %H:%M:%S %z'); \
	cp "_template.md" "$$fullname"; \
	sed -i "s/{{title}}/$(TITLE)/g" "$$fullname"; \
	sed -i "s/{{date}}/$$local_datetime/g" "$$fullname"; \
	echo "Post created: $$fullname"
