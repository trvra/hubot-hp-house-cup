# hubot-hp-house-cup

A hubot script for keeping track of House Cup Points (a la [Harry Potter](http://harrypotter.wikia.com/wiki/House_Cup))

See [`src/hp-house-cup.coffee`](src/hp-house-cup.coffee) for full documentation.

## Installation

In hubot project repo, run:

`npm install hubot-hp-house-cup --save`

Then add **hubot-hp-house-cup** to your `external-scripts.json`:

```json
["hubot-hp-house-cup"]
```

## Sample Interaction

```
user1>> hubot give 20 points to Ravenclaw
hubot>> Ravenclaw now has 20 points!
user1>> hubot -10 Slytherin
hubot>> Slytherin now has -10 points!
```
