chef-mupdf
================

Chef cookbook for installing [mupdf][mupdf].

This cookbook installs mupdf from the source.

Usage
=====

Simply include the recipe `mupdf`.

Testing
=======

You can test this recipe locally using [Vagrant][vagrant] with
the supplied Vagrantfile. Make sure Vagrant is installed:

	gem install vagrant

Then simply:

	vagrant up

To test changes against an already running Vagrant box run:

	vagrant provision

[mupdf]: http://www.mupdf.com/
[vagrant]: http://www.vagrantup.com