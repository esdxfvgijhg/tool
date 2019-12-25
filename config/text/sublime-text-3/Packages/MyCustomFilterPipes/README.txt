CUSTOM PLUGIN FILTERS
=====================

This directory contains the a set of filters to be customized
by you, the user. It's pre-populated with a few that show you
the basics of how to create your own. These examples are
designed to be useful in their own right. But feel free to
modify, rename, or remove them as you see fit.

To restore it to this initial state, just remove or
rename this directory and re-create it using the
"My Custom Filters" command.

This plugin was created at:
/home/aghiles/Aghiles/Tool/config/subrid/Packages/MyCustomFilterPipes

FILES
=====

You should pay attention to the following files. The others... meh.

Default.sublime-commands
------------------------

A good first place to start. This is where you define what commands
will appear in your command palette. You can use the same Python
class to create multiple commands using different arguments. You'll
see several examples of that in example content provided.

You can create a Default.sublime-keymap file to do the same thing
but for keyboard shortcuts instead of command palette entries.

myfilters.py
------------

This contains examples of custom Python filters. Each filter command
is its own classes with a filter() function. The naming convention
on the class is enforced by Sublime, so follow the pattern you see
in the file; namely: camelcase words ending in "Command". For example,
to create a command named "convert_to_lowercase" your class will be
named ConvertToLowercaseCommand.
