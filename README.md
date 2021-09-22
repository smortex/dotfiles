# dotfiles

A [Bolt](https://puppet.com/docs/bolt/latest/bolt.html) project to manage my configuration files.

## Goals

* Some kind of roles and profiles to handle my configuration of different types of nodes (e.g. laptop, workstation, remote system where I am just a regular user);
* Centralize different harware configurations (e.g. laptops with different vendors with different hardware);
* Centralize different "subconfig" on a common base (e.g. workstations with different number of screen need a different fvwm configuration).

## Why not in a control-repo?

I do not feel these files belong to a [control-repo](https://github.com/puppetlabs/control-repo):

* I want them on nodes managed by different organizations (i.e. my employer, myself) which have their own Puppet infrastructure;
* Their life-cycle is disconnected from these organizations;
* These configuration will end-up on nodes which might not be managed by Puppet.

## Requirements

Bolt must have access to the `skittlize` gem.  Install it as usual, but if using AIO package, use the version of `gem(1)` bundled with Bolt.

```
/opt/puppetlabs/bolt/bin/gem install skittlize
```

## How?

Puppet must be usable on systems where configuration has to be managed.  It does not need to be installed system-wide, a user install of Puppet is enough if the PATH allows to find it (but a [patch is currently needed](https://github.com/puppetlabs/puppetlabs-puppet_agent/pull/581)).

For now, there are only profiles in the project, they are applied using `bolt apply`:

```
bolt apply -e 'include profile::foo' -t target.example.com
```
