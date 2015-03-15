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

## This is completely broken
It might be! I'm so sorry! Would you please log an issue here on Github so this module can be improved?

## Roadmap
- Yo: most of the code in this repo is stubbed out from yeoman, but I want to take a pass and ensure that it is as local organic artisanal as I want it to be
- Actual tests: should be able to make changes, run tests, and feel confident in pushing new versions
- More complex Regex: this module should capture more natural language forms of adding and removing points
- Reasons: this module should be able to store and retrieve reasons for why points were added and removed
