
JSHINT_CONFIG := jshint.config
JAVASCRIPT_SOURCE_DIRS := public spec
JAVASCRIPT_SOURCES := $(shell find $(JAVASCRIPT_SOURCE_DIRS) -name *.js)
TARGET := target
TARGET_JSHINT := $(TARGET)/jshint

all: target jshint

.PHONY: clean
clean:
	rm -fr $(TARGET)

.PHONY: testem
testem: target
	rm -f $(TARGET)/testem.log
	testem.js -d --debuglog $(TARGET)/testem.log -f testem.yml

target:
	mkdir -p $(TARGET)

PHONY: jshint
jshint: $(addprefix $(TARGET_JSHINT)/, $(JAVASCRIPT_SOURCES:.js=.jsh))

$(TARGET_JSHINT)/%.jsh: %.js
	jshint $< --config $(JSHINT_CONFIG)
	mkdir -p $(@D); touch $@

