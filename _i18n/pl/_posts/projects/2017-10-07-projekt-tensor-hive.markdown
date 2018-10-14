---
layout: article-post
locale: pl
title:  "TensorHive"
date:   2017-10-07 12:00:00
author: Paweł Rościszewski i Michał Martyniak
categories: Projekty
tags:	tensorhive gpu monitoring tensorflow
comments: true
cover:  "/assets/projects/tensorhive/cover.png"
thumbnail: "/assets/projects/tensorhive/thumbnail.png"
---

![Logo TH](/assets/projects/tensorhive/thumbnail.png)

TensorHive jest lekkim narzędziem do zarządzania kilkoma serwerami wyposażonymi w GPU
współdzielonymi przez wielu użytkowników do uczenia maszynowego w TensorFlow. Narzędzie
jest lekkie w takim sensie, że wystarczy instalacja za pomocą pip, prosta konfiguracja poprzez
wprowadzenie listy nazw hostów i już można korzystać z aplikacji webowej przedstawiającej
na bieżąco parametry zasobów obliczeniowych na podstawie modułu automatycznego monitorowania.

![Terminal z uruchomionym TensorHive](/assets/projects/tensorhive/terminal.png)

![Monitorowanie](/assets/projects/tensorhive/monitoring.png)

Zdefiniowanie kont użytkowników powiązanych z loginami na wykorzystywanych maszynach pozwala
na dokonywanie rezerwacji zasobów na przyszłość za pomocą przejrzystego kalendarza, a naruszenia
harmonogramu są wykrywane i skutkują akcjami wobec naruszającego: od informacji w konsoli, przez
wysłanie maila po zabicie nieuprawnionego procesu.

![Rezerwacje](/assets/projects/tensorhive/reservations.png)

![Naruszenie](/assets/projects/tensorhive/violation.png)  

TensorHive wykorzystuje REST API zrealizowane przy użyciu OpenAPI, dzięki czemu jest możliwe 
rozszerzenie go o kolejne interfejsy użytkownika.

![swagger](/assets/projects/tensorhive/swagger.png)

W kolejnym etapie projektu planujemy dodać funkcjonalność uruchamiania rozproszonych treningów
w TensorFlow. Wymaga to uruchomienia wielu procesów na różnych serwerach. TensorHive pozwoli
użytkownikowi zdefiniować program treningowy, wybrać urządzenia, a procesy zostaną uruchomione
automatycznie, a następnie monitorowane i w razie potrzeby zabite. Narzędzie scentralizuje
wiedzę o systemie i zapotrzebowaniu użytkowników, co pozwoli na zaimplementowanie mechanizmów
szeregowania zadań, aby żadne z dostępnych cennych GPU się nie marnowało.

TensorHive tworzony jest z myślą o prawdziwych użytkownikach i prawdziwych aplikacjach. Narzędzie
działa na serwerach Wydziału ETI, w tym najnowszym serwerze NVIDIA® DGX Station™. Zapotrzebowanie
na funkcjonalności zgłaszane jest też przez firmę VoiceLab z Gdańska, która zajmuje się
automatycznym rozpoznawaniem mowy.

Przygotowujemy [realne scenariusze aplikacji treningowych](https://github.com/roscisz/TensorHive/tree/develop/examples "Przykładowe aplikacje") treningowych
z dziedzin rozpoznawania obrazów,
przetwarzania języka naturalnego i automatycznego rozpoznawania mowy, które pozwolą nam na
ciągłe testowanie funkcjonalności narzędzia TensorHive. W trakcie prac dowiadujemy się też
ciekawych rzeczy o przebiegu treningów rozproszonych w zależności od algorytmów, parametrów
i wykorzystywanego sprzętu. 


Repozytorium projektu: [https://github.com/roscisz/TensorHive](https://github.com/roscisz/TensorHive)

### Zespół
- Paweł Rościszewski,
- Michał Martyniak,
- Filip Schodowski,
- Tomasz Menet,
- Karol Draszawka.
