---
layout: article-post
locale: en
title:  "Planning in Imagination"
date:   2018-10-08 12:00:00
author: Piotr Januszewski
categories: Projects
tags:	project reinforcement_learning
comments: true
cover:  "/assets/projects/planning_in_imagination/cover.jpg"
thumbnail: "/assets/projects/planning_in_imagination/thumbnail.jpg"
---

We’d like to use representation power of [World Models](https://worldmodels.github.io) to enable
 [AlphaZero](http://tim.hibal.org/blog/alpha-zero-how-and-why-it-works/)-like algorithm to plan in environments
 where dynamics model isn’t directly accessible (one can’t simulate the environment). Model needs to learn how
 the world, he is currently in, works and how to use this model to plan next action. Example of such a problem
 can be Sokoban game, when one wants to train AI agent directly from raw pixel data without any prior knowledge.

GitHub page for World Models can be found [here](https://github.com/piojanu/World-Models). Also, AlphaZero
 reimplementation is available [on our GitHub](https://github.com/piojanu/AlphaZero).

### Team

- Piotr Januszewski,
- Grzegorz Beringer,
- Mateusz Jabłoński,
- Piotr Sobczak
