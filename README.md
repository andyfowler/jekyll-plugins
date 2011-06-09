What?
=====

Just a public place to stash some of the hacky Jekyll plugins I've built that are currently gathering dust in various Gists. Not much documentation here.

solr.rb
-------

Iterates all pages, determines if they belong in Solr, and submits them. Depends on an environmental variable for the Solr host, and if it doesn't exist it skips indexing. Makes `jekyll --auto` stay fast if you don't want to reindex every save.

summarize.rb
------------

A filter to only print things before the `<!--more-->` tag. In the style of a popular blogging engine.

lessjs.rb
---------

Compile all `.less` files into CSS using less.js, which is usually easiest to add to your Jekyll project as a submodule.

growl_notifer.rb
----------------

Sends growl notifications before and after builds. The completed notification is priority 1, so it's easy to light it up. Won't explode if used on a C.I. box that doesn't have Growl or isn't on OS X.