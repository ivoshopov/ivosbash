
BINDIR=$(HOME)/.local/bin
bin_files+=color.sh
bin_files+=git-prompt.sh
bin_files+=proxy.sh
bin_files+=cpuspeed
bin_files+=color-table
bashrc=$(HOME)/.original_bashrc

all:
	echo "Please run \"make install\" to install the scripts"

install: $(bashrc) $(bin_files)

$(bashrc):
	if [ -f $(HOME)/.bashrc ]; then \
		cp $(HOME)/.bashrc $@.tmp; \
	else \
		touch $@.tmp; \
	fi
	cat bashrc >> $(HOME)/.bashrc
	mv $@.tmp $@


.PHONY: $(bin_files)
$(bin_files): | $(BINDIR)
	cp bin/$@ $(BINDIR)/

$(BINDIR):
	mkdir -p $@

clean:
	mv $(bashrc) $(HOME)/.bashrc
	rm $(addprefix $(BINDIR)/,$(bin_files))
	rmdir $(BINDIR)

.PHONY: test
test: install
	bash test/color.sh
