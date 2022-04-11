# Volta

![icon](icon.png)

A simple 2D walking simulator framework thingy for the Godot Engine.
It's a fun little project I'm working on to relax.

Godot version: 3.4.3

![pic1](https://raw.githubusercontent.com/AlexandrosKap/volta-pictures/main/pic1.png)

![pic2](https://raw.githubusercontent.com/AlexandrosKap/volta-pictures/main/pic2.png)

## Ideas

* Events:

  Change the structure of Event objects.
  Functionality based on components and not on inheritance.

* Parser Singleton:

  Parsers should be unique objects because they don't hold mutable data.
  Creating a parser object for every Event object in the scene is a waste of time.
