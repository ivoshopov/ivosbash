
bin_files+=color.sh
bin_files+=git-prompt.sh
bin_files+=proxy.sh
bashrc=$(HOME)/.original_bashrc

all: $(bashrc) $(bin_files)

$(bashrc):
	if [ -f $(HOME)/.bashrc ]; then \
		cp $(HOME)/.bashrc $@.tmp; \
	else \
		touch $@.tmp; \
	fi
	cat bashrc >> $(HOME)/.bashrc
	mv $@.tmp $@


.PHONY: $(bin_files)
$(bin_files): $(HOME)/bin
	cp bin/$@ $(HOME)/bin/

$(HOME)/bin:
	mkdir $(HOME)/bin

clean:
	mv $(bashrc) $(HOME)/.bashrc
	rm $(addprefix $(HOME)/bin/,$(bin_files))
	rmdir $(HOME)/bin
