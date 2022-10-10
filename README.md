What's this?
============

I came to find myself often working on different machines at home on my desk or
on the laptop, at the company or at university. So I followed an idea I saw in
many Github Accounts and created a dot-files repository which holds all the
basic configuration, that I use on a regular basis.

Writing these I keep in mind that other people might want to find use of it, so
I will always create files as general purpose as possible and comment where I
consider it appropriate. I'm not a big fan of oververbose documentation, though
and in most cases the code itself should be good enough to explain itself. If
you hit something that you might need or want to understand but it's not clear
to you, then ask me. Every feedback is appreciated and considerated!

Usage
=====

Prerequisits:

 * Although parts of it might work on other distributions as well, I only
   tested these on Ubuntu 13.4 machines. So you will probably achieve the best
   results on Ubuntus or at least Debian-likes.
 * Make sure that your own files are **backed up** before you start using this,
   because I generally remove the corresponding system files before installing
   my own.

Let's go:

    # make sure you have the newest git installed:
    $ sudo add-apt-repository ppa:git-core/ppa
    $ sudo apt-get install git

    # download this repo:
    $ git clone git@github.com:erikbgithub/dot-files
    $ cd dot-files

    # install it
    $ make

Then log out of your shell session and create a new one, so you can use all
your configuration files.

What do you think?
==================

Feedback is always appreciated. If you find errors, optimizations or just want
to discuss an idea, don't hesitate to
[write an Issue](https://github.com/erikb85/dot-files/issues/new).
