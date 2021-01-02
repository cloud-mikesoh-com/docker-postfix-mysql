# Ubuntu-based `postfix` Mail Server with MySQL enabled

This image was inspired by [catatnight's docker image](https://github.com/catatnight/docker-postfix), 
meaning that the Dockerfile was used as a reference but enough changes
were made that direct contribution may not necessarily be necessary but
would not be in the spirit of Open Source.

## This image is no longer under development

This project is archived as of 1/1/2021.

## Image Requirements

The reason I am creating a new image instead of the [literally
hundreds](https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=postfix&starCount=0)
that are available is because I wanted to build something more robust
for my specific needs.  Here are the requirements:

1. Install the latest version of `postfix`, not just the latest that is
   available via the `apt` repository.  This means the inclusion of
   [Peter van der
   Does' postfix repository](https://launchpad.net/~pdoes/+archive/ubuntu/postfix).
2. Install `postfix-mysql` to allow for [virtual
   aliasing](http://www.postfix.org/VIRTUAL_README.html) as well as
   other database references.
3. Install SSL keys for secure communication, and if possible, utilize
   [Let's Encrypt](https://letsencrypt.org/) certificates.
4. Drop incoming mail into `/var/spool/postfix` for end-user processing.


