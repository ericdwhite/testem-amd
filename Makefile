TARGET := target

ALL_JAVASCRIPT_SOURCES := $(addprefix $(TARGET)/public/, $(shell find js -name *.js))

JAVASCRIPT_SOURCE_DIRS := js/spec js/amd-app
JAVASCRIPT_SOURCES := $(shell find $(JAVASCRIPT_SOURCE_DIRS) -name *.js)

LESS_SOURCE_DIRS := css
LESS_SOURCES := $(shell find $(LESS_SOURCE_DIRS) -name *.less) $(shell find $(LESS_SOURCE_DIRS) -name *.css)

HTML_SOURCE_DIRS := public
HTML_SOURCES := $(addprefix $(TARGET)/, $(shell find $(HTML_SOURCE_DIRS) -type f))

TARGET_JSHINT := $(TARGET)/jshint
JSHINT_CONFIG := jshint.config

# Binaries
LESSC:=node_modules/.bin/lessc
CP:=rsync -a

all: target jshint dist

.PHONY: clean
clean:
	rm -fr $(TARGET)

.PHONY: testem
testem: target
	rm -f $(TARGET)/testem.log
	testem.js -d --debuglog $(TARGET)/testem.log -f testem.yml

target:
	mkdir -p $(TARGET)
	mkdir -p $(TARGET)/public/css

PHONY: jshint
jshint: $(addprefix $(TARGET_JSHINT)/, $(JAVASCRIPT_SOURCES:.js=.jsh))

HONY: dist
dist: target less $(ALL_JAVASCRIPT_SOURCES) $(HTML_SOURCES)

PHONY: less
less: target $(addprefix $(TARGET)/public/, $(LESS_SOURCES:.less=.css))

PHONY: watch
watch:
	@echo "Using ruby watchr (see; bundle install --path ruby_modules)"
	bundle exec watchr -e "watch('(css|public|js)/.*'){system 'make'}"

$(TARGET_JSHINT)/%.jsh: %.js
	jshint $< --config $(JSHINT_CONFIG)
	mkdir -p $(@D); touch $@

$(TARGET)/public/%.css: %.less
	mkdir -p $(@D)
	$(LESSC) $< $@

$(TARGET)/public/%.css: %.css
	mkdir -p $(@D)
	$(CP) $< $@

$(TARGET)/public/%.js: %.js
	mkdir -p $(@D)
	$(CP) $< $@

$(TARGET)/%: %
	mkdir -p $(@D)
	$(CP) $< $@

