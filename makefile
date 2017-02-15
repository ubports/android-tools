##
#  Copyright (C) 2017 The ubports project.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# Author: Marius Gripsgard <mariogrip@ubports.com>
##

PREFIX = /usr

all: copy

fastboot:
	$(MAKE) -C src/fastboot

adb:
	$(MAKE) -C src/adb

copy: fastboot adb
	cp -f src/fastboot/fastboot fastboot
	cp -f src/adb/adb adb

clean:
	$(MAKE) -C src/fastboot clean
	$(MAKE) -C src/adb clean
	rm fastboot adb

.PHONY: install
install: copy
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp fastboot $(DESTDIR)$(PREFIX)/bin/fastboot
	cp adb $(DESTDIR)$(PREFIX)/bin/adb

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/fastboot
	rm -f $(DESTDIR)$(PREFIX)/bin/adb
