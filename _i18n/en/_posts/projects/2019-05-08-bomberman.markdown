---
layout: article-post
locale: en
title:  "RL vs. Bomberman"
date:   2018-05-08 10:00:00
author: Bartłomiej Borzyszkowski
categories: Projects
tags:	project reinforcement_learning bomberman
comments: true
cover: "/assets/projects/rl_vs_bomberman/cover.jpg"
thumbnail: "/assets/projects/rl_vs_bomberman/thumbnail.jpg"
---

In this project, we compare various agents and their behaviour in different environments of the classic console game Bomberman
 and present our analyse of exploration methods. The aim of Bomberman is to eliminate all of oponents from the map by placing
 bombs in their range and collecting additional bonuses. We employ multilayer convolutional neural networks (CNNs) and reinforcement
 learning (RL) to train agents, which achieve challenging results in the gameplay. Our work is based on model-free algorithms: 
 simple Q-learning, fixed Q-targets, double DQN and dueling DQN. Furthermore, we present our own game environment in confrontation
 with Pommerman, popular AI competition. Finally, we discuss existing exploration methods such as Max-Boltzmann, Random-Walk, Greedy,
 E-Greedy and explain systems of rewards implemented in agents as well as tactics they have learned.

Our own environment "Bombermna - Brics" and trained agents are available at GitHub repositories:
 [Environment Bomberman - Brics](https://github.com/Borzyszkowski/Bomberman-Brics).
 [RL vs Bomberman](https://github.com/Borzyszkowski/RL-Bomberman-Gradient).

Project was presented on several events and conferences such as FOKA 2019 and GUT Day for AI. 
At the moment, our team is working on scientific paper which will be presented in following months.

### Team

 - Bartłomiej Borzyszkowski, GUT
 - Marcin Świniarski, GUT
 - Hubert Skrzypczak, GUT
 - Grzegorz Opoka, AGH
 - Maksymilian Bubala, AGH

