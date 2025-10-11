OLD_DIR := old
FRAMER_DIR := invigorated-product-322373.framer.app

.PHONY: all refresh clean

all: refresh

refresh: clean
	httrack "https://invigorated-product-322373.framer.app" -O "." -n -v -r3 -F "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36" -%e0 -c4 -s0 -%P
	rm -f index.html
	cp $(FRAMER_DIR)/index.html ./index.html
	rm -rf $(FRAMER_DIR)
	sed -i '' 's|\.\./||g' index.html

clean:
	find . -maxdepth 1 ! -name 'CNAME' ! -name 'Makefile' ! -name '$(OLD_DIR)' ! -name '.' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} +
