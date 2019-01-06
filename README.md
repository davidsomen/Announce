Announcer
=========

To be used in conjunction with a cron job to announce the hour, on the hour.

```
# Run at midnight and every hour between 6 and 11pm

0 0,6-23 * * * ~/Announcer/speak.rb
```

## Usage

```
speak
```

## Requirements

* Ruby
* mpg123
* AWS credentials (set in env.yml)

## Install

```
sudo apt install mpg123

bundle install
````
