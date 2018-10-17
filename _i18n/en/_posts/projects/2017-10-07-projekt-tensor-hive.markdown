---
layout: article-post
locale: en
title:  "TensorHive"
date:   2017-10-07 12:00:00
author: Paweł Rościszewski and Michał Martyniak
categories: Projects
tags:	tensorhive gpu monitoring tensorflow
comments: true
cover:  "/assets/projects/tensorhive/cover.png"
thumbnail: "/assets/projects/tensorhive/thumbnail.png"
---

![TH logo](/assets/projects/tensorhive/thumbnail.png)

TensorHive is a lightweight tool for managing a number of workstations equipped with
GPUs shared between multiple users for machine learning in TensorFlow. The tool is leightweight
in the sense that only installation through pip and simple configuration by providing a list
of hostnames, allows to use a web application that shows live parameters of the available
computing resources based on the automatic monitoring module.

![Terminal with TensorHive running](/assets/projects/tensorhive/terminal.png)

![The monitoring view](/assets/projects/tensorhive/monitoring.png)

Defining user accounts linked with logins on the utilized machines allows to make 
reservations for computing resources in the future, using a convenient calendar.
Harmonogram violations will be detected and result in various actions towards the
violating user: starting from console information, through sending an email to killing
the violating process.

![The reservations view](/assets/projects/tensorhive/reservations.png)

![Violation](/assets/projects/tensorhive/violation.png)  

TensorHive uses a REST API implemented using OpenAPI, which makes it extendable by 
new user interfaces.

![swagger](/assets/projects/tensorhive/swagger.png)

In the following stage of the project we plan to add a functionality of running distributed
TensorFlow trainings. This requires running multiple process on different servers. TensorHive
will allow the user to define a training program and choose computing devices, and the processes
will be spawned automatically, monitored and, if necessary, killed. The tool will centralize
knowledge about the system and user requests, which will allow to implement scheduling mechanisms,
so that no more precious GPU time is wasted.

TensorHive is developed with real users and applications in mind. The tool works on the servers
of the Faculty of ETI, including the newest NVIDIA® DGX Station™ server. Feature requirements
are submitted by the VoiceLab company based in Gdańsk, which deals with automatic speech
recognition.

We are preparing [real-life secnarios of training applications](https://github.com/roscisz/TensorHive/tree/develop/examples "Exemplary applications")
in the fields of image recognition, natural language processing and automatic speech recognition,
which will allow us to constantly test the TensorHive functionalities. Additionally, during the
development we gain interesting knowledge about the process of distributed neural network training
depending on used algorithms, parameters and utilized hardware.

Project repository: [https://github.com/roscisz/TensorHive](https://github.com/roscisz/TensorHive)

### Team
- Paweł Rościszewski,
- Michał Martyniak,
- Filip Schodowski,
- Tomasz Menet,
- Karol Draszawka.
