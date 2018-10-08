---
layout: article-post
locale: pl
title:  "Planning in Imagination"
date:   2018-10-08 12:00:00
author: Piotr Januszewski
categories: Projekty
tags:	projekt reinforcement_learning
comments: true
cover:  "/assets/projects/planning_in_imagination/cover.jpg"
thumbnail: "/assets/projects/planning_in_imagination/thumbnail.jpg"
---

Chcemy wykorzystać umiejętność reprezentacji problemu, którą prezentuje praca [World Models](https://worldmodels.github.io) do zastosowania
 mocy planowania na wzór [AlphaZero](http://tim.hibal.org/blog/alpha-zero-how-and-why-it-works/) w środowiskach,
 gdzie nie mamy bezpośredniego dostępu do modelu dynamiki środowiska (nie możemy symulować tegoż środowiska).
 Model musi nauczyć jak działa świat w którym się znajduje i użyć tej wiedzy do planowania swoich działań. Przykładem
 takiego środowiska może być gra Sokoban, gdzie chcemy uczyć się z surowych pikseli i interakcji z grą, bez żadnej
 wiedzy domenowej o samej grze.

W tym momencie projekt nie jest publicznie dostępny, przygotowaliśmy natomiast publiczne reimplementacje
 [World Models](https://github.com/piojanu/World-Models) i [AlphaZero](https://github.com/piojanu/AlphaZero)
 na potrzeby projektu.

### Zespół

- Piotr Januszewski,
- Grzegorz Beringer,
- Mateusz Jabłoński,
- Piotr Sobczak

