---
layout: article-post
title:  "TensorHive"
date:   2017-10-07 12:00:00
author: Paweł Rościszewski
categories: Projekty
tags:	projekt tesnsorhive
comments: true
cover:  "/assets/projects/tensorhive/cover.jpg"
thumbnail: "/assets/projects/tensorhive/thumbnail.jpg"
---

W przypadku dużych architektur neuronowych i zbiorów danych treningowych, treningi mogą trwać wiele godzin. Na przykład w projekcie AlphaGo, sieć do klasyfikacji pozycji w grze Go na podstawie archiwalnych ruchów ekspertów była trenowana przez trzy tygodnie na 50 GPU. Rozproszenie treningu na wiele urządzeń jest nieuniknione w wielu praktycznych zastosowaniach. Choć trening sieci neuronowych jest problemem trudnym do zrównoleglenia, popularne frameworki do uczenia głębokiego udostępniają pewne mechanizmy treningu rozproszonego.

Na przykład, użycie tzw. [Distributed TensorFlow](https://www.tensorflow.org/deploy/distributed) wymaga uruchomienia kilku+ programów treningowych (serwerów parametrów i workerów) na rozproszonych zasobach obliczeniowych. Jest to czasochłonne, gdyż należy odpowiednio ustawić parametry poszczególnych zadań, by zapewnić odpowiednią komunikację pomiędzy nimi. Zadanie staje się jeszcze trudniejsze w przypadku współdzielenia zasobów przez wielu użytkowników oraz różnych priorytetów poszczególnych zadań, czy też możliwości sterowania priorytetami przez admina.  Dodatkowo, w obliczu często zmieniającego się API TensorFlow, przydatne byłoby łatwe sterowanie wykorzystywaną wersją biblioteki (np. przez virtualenv).

Istniejące systemy do zarządzania zasobami obliczeniowymi są integrowane z frameworkiem TensorFlow w ramach tzw. [TensorFlow ecosystem](https://github.com/tensorflow/ecosystem). W kontekście Google często mowa tu o rozwiązaniach “cloudowych” typu [Docker](https://github.com/tensorflow/ecosystem/tree/master/docker), [Kubernetes](https://github.com/tensorflow/ecosystem/tree/master/kubernetes), a także klastrowych typu [SLURM](https://deepsense.io/tensorflow-on-slurm-clusters/). Środowisko tzw. big data tworzy wrappery dedykowane popularnym technologiom takim, jak Apache Spark, Hadoop. Każde z tych rozwiązań wymaga znajomości, instalacji i konfiguracji powyższych systemów, co kłóci się z założeniem dostępności TensorFlow dla szerokiej rzeszy programistów.

Celem projektu TensorHive byłoby stworzenie lekkiego frameworka do rozpraszania treningów w Distributed TensorFlow, który wymagałby jedynie podania listy hostów dostępnych przez SSH, sam dokonywałby wykrycia dostępnych zasobów, umożliwiałby monitoring zajęcia zasobów, zarządzanie i szeregowanie zadań. Z podobną tematyką mierzyliśmy się w KASKu do tej pory w ramach projektu [KernelHive](http://onlinelibrary.wiley.com/doi/10.1002/cpe.3719/abstract), którego elementy mogą być wykorzystane w nowym projekcie. Mechanizm uruchamiania zadań mógłby być współdzielony przez oba systemy. Aby skorzystać z istniejącej marki, a jednocześnie reklamować ją dalej, proponuję rozwijać projekt pod nazwą TensorHive.

Repozytorium projektu: https://github.com/roscisz/TensorHive

### Zespół
- Paweł Rościszewski (w ramach dalszej pracy badawczej),
- Witold Netel (praca mgr.),
- Michał Martyniak,
- Dariusz Piotrowski.
