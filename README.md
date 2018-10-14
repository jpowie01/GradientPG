# Gradient - Politechnika Gdańska
Witaj w repozytorium strony internetowej koła naukowego "Gradient". Poniżej zamieściliśmy kilka informacji,
 które mogą się przydać podczas Twojego wkładu w rozwój strony. Prosimy Cię o dostosowanie się do panującego regulaminu!

W przypadku problemów śmiało pisz do Administratorów lub Zarządu Koła. Na pewno ktoś Ci pomoże :)

## FAQ
Poniżej zamieszczamy sporą ilość pytań i odpowiedzi, które zapewne będą się pojawiać na bieżąco :)

### Q: Czego potrzebuje do dodania nowego posta na stronie?
Chęci :)

### Q: Jak dodać nowy post lub projekt?
Nowy post albo projekt można dodać poprzez utworzenie nowego pliku Markdown (.md/.markdown) w folderze `_posts`.
 Posty oraz projekty należy przygotować w dwóch wersjach językowych, których miejsce znajduje się w katalogu `_i18n`.
 Przykładowe projekty możesz znaleźć w folderze `examples`.

Ważnym jest odpowiednie nazewnictwo pliku! W przeciwnym przypadku silnik strony może nie wykryć Twojej treści.
 Prosimy o dostosowanie się do przyjętej konwencji nazwenictwa w odpowiednim formacie:

```
[ROK]-[MIESIĄC]-[DZIEŃ]-[tytul-posta-malymi-literami-bez-pl-znakow].markdown
```

### Q: Jak udostępnić mój post w ramach strony?
Do kontrybucji będziemy wykorzystywać następujący flow:
1. Zrób forka repozytorium (przycisk "Fork"), a następnie sklonuj repozytorium gdzieś u siebie na komputerze:  
```bash
$ git clone https://github.com/TWOJ_GITHUB_LOGIN/GradientPG.git
```
2. Stwórz brancha, na którym będziesz pracować (proszę o zachowanie konwencji nazewniczej):
```bash
$ git checkout -b imie_nazwisko/tytul_posta_lub_projektu
```
3. Zmodyfikuj stronę oraz przetestuj ją lokalnie.
4. Zacommituj swoje zmiany:
```bash
$ git add .
$ git commit -m "Opis wprowadzonych zmian"
```
5. Wyślij swoje zmiany na GitHuba:
```bash
$ git push origin imie_nazwisko/tytul_posta_lub_projektu
```
6. Wejdź na GitHuba, a następnie utwórz Pull Request (więcej informacji znajdziesz
 [tutaj](https://help.github.com/articles/creating-a-pull-request/#creating-the-pull-request)).  

### Q: Nigdy wcześniej nie korzystałem/-am z Gita. Muszę się go uczyć?
Git stał się obecnie najpowszechniejszym narzędziem do kontroli wersji. Prędzej czy później każdy z nas będzie
 się go musiał nauczyć :)

W Internecie znajduje się mnóstwo kursów (polecam [http://gitimmersion.com/](http://gitimmersion.com/)),
 a także interaktywnych tutoriali. Główny workflow zamieściliśmy powyżej - na pewno sobie poradzisz :)
 W przypadku problemów prosimy o kontakt - spróbujemy pomóc.

### Q: Jak postawić całą stroną u mnie na komputerze?
Postaraliśmy się, aby stronę można było postawić jak najszybciej oraz jak najwygodniej. Istnieją trzy
 możliwe drogi, których wybór zależy od Ciebie.

##### Opcja A. Vagrant (rekomendowana)
Jest to najwygodniejsza możliwa droga do przetestowanie swojej treści u siebie lokalnie. Wymaga, aby na Twoim komputerze znajdował się:
- [VirtualBox](https://www.virtualbox.org) (im nowsza wersja tym lepiej - przynajmniej v5.1.0),
- [Vagrant](https://www.vagrantup.com).

Gdy upewnisz się, że wszystkie narzędzia już posiadasz, wymagane są poniższe kroki:
1. Wejdź do terminala i przejdź do katalogu z poniższym projektem.
2. Uruchom polecenie:
```bash
$ vagrant up
```
W tym momencie Vagrant przygotuje dla Ciebie maszynę wirtualną z Linuxem oraz wszelkimi potrzebnymi zależnościami.
 **Cierpliwości** - to może chwilę potrwać! :)

3. Połącz się z maszyną wirtualną poprzez SSH:  
```bash
$ vagrant ssh
```
4. Uruchom skrypt odpalający stronę na Twojej maszynie:
```bash
ubuntu@ubuntu-xenial:~$ cd /vagrant
ubuntu@ubuntu-xenial:/vagrant$ ./run_server.sh --watch
```
5. Gotowe! Strona powinna być dostępna pod adresem `http://10.0.0.99/` i zmieniać swoją treść wraz z Twoimi modyfikacjami.

**TIP:** Jeżeli masz problemy z automatycznym odświeżaniem zawartości strony podczas modyfikacji treści, usuń opcję `--watch` i restartuj
serwer manualnie po każdej zmianie. Bardzo możliwe, że jest to bug po stronie Jekylla.

##### Opcja B. Docker Compose
Ta opcja jest dobra, jeżeli chcesz zobaczyć wynik swoich prac i korzystasz z Linuxa/macOS (Windows może nie być w pełni wspierany).

Instrukcja:
1. Zainstaluj na swoim komputerze Dockera wraz z Docker Compose. Szczegółowe instrukcje znajdziesz na ich stronie i
 [dokumentacji](https://www.docker.com/community-edition).
2. Sklonuj repozytorium gdzieś u siebie na komputerze:  
```bash
$ git clone https://github.com/jpowie01/GradientPG.git
```
3. W folderze ze źródłami użyj polecenia:
```bash
$ docker-compose up
```
**UWAGA!** Polecenie za pierwszym razem może chwilę potrwać ze względu na pobranie obrazu z Internetu!

4. Gotowe! Przejdź do swojej przeglądarki i wejdź na stronę `http://127.0.0.1:4000/`. Gdy tylko dodasz swoją treść do kodu
 - strona powinna zostać automatycznie wygenerowana oraz będzie sama aktualizowała swoją treść.

**TIP:** Z powodu buga (prawdopodobnie w samym Jekyllu) sugerujemy trzymanie niniejszego projektu w miejscu, do którego
 ścieżka będzie zawierała tylko i wyłącznie kody ASCII (bez polskich znaków). W przeciwnym wypadku możesz mieć problemy
 z długą (bądź nawet wyłączoną) automatyczną aktualizacją strony.

##### Opcja C. Zainstalowanie wszystkiego natywnie
Jest to opcja szczerze mówiąc masochistyczna. Wymaga ona instalacji wszystkich składników osobno. Jest to o tyle trudniejsza
 droga do opisania, gdyż zależy ona od posiadanego systemu operacyjnego.  

Przykładowo - dla Ubuntu należy wykonać następujące kroki:
1. Zainstaluj na swoim komputerze następujące paczki:
```bash
$ sudo apt-get install make gcc ruby ruby-dev nodejs
```
2. Zainstaluj następujący pakiet za pomocą Gema:
```bash
$ gem install bundler
```
3. Sklonuj repozytorium gdzieś u siebie na komputerze:  
```bash
$ git clone https://github.com/jpowie01/GradientPG.git
```
4. W folderze ze źródłami wykonaj następujące polecenie:
```bash
$ bundle install
```
5. Następnie uruchom stronę następującym poleceniem:
```bash
$ bundle exec jekyll serve
```
6. Gotowe! Przejdź do swojej przeglądarki i wejdź na stronę `http://127.0.0.1:4000/`. Gdy tylko dodasz swoją treść do
 kodu - strona powinna zostać automatycznie wygenerowana.

Jak widzisz - nie jest to prosta droga. Co więcej, możesz zrobić sobie niezły syf na komputerze. Jest to niestety
 jedyna droga w przypadku, gdy z jakiejś przyczyny (np. słaby komputer, brak odpowiedniego systemu, itd.) nie jesteś
 w stanie użyć Dockera/Vagranta.

Pomocne mogą się okazać następujące źródła:
- [dokumentacja Jekylla](https://jekyllrb.com),
- [dokumentacja GitHub Pages](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/).

### Q: Czy muszę stawiać stronę lokalnie?
Nie, nie musisz, ale nie będziesz mógł upewnić się, że Twoje dzieło będzie wyglądało poprawnie na stronie.  
**Rekomendujemy, aby testować swoje posty i projekty lokalnie!**

### Q: Kiedy pojawi się mój post na stronie?
Strona aktualizuje się o każdej pełnej godzinie. Staraliśmy się o auto-deployment przy każdym merge'u,
 ale wymaga to trochę więcej wysiłku... Może pewnego dnia ulepszymy ten proces.

### Q: Jak dodać kod do mojego tekstu?
Aby dodać kod, wystarczy, że użyjesz następującej składni:
```
{% highlight python %}
def demo(arg1, arg2):
	print(arg1 + ', ' + arg2 + '!')

demo('hello', 'world')
{% endhighlight %}
```

### Q: Jak dodać wzór matmatyczny do mojego tekstu?
Na stronie można swobodnie umieszczać wzory matematyczne zapisane w formacie LaTeX. Wystarczy je owinąć w znacznik
 podwójnego dolara, a reszta zostanie sparsowana auto-magicznie. Biblioteka, którą zainstalowaliśmy powinna także
 poradzić sobie z innymi formatami.

Przykład użycia wzoru zapisanego w LaTeX:
```
$$
\begin{equation}
  {\sum\limits_{n=1} }'C_n
\end{equation}
$$
```

Więcej przykładów znajdziecie [tutaj](https://cdn.mathjax.org/mathjax/latest/test/examples.html).  
**Tip:** Pobierzcie sobie dany przykład na dysk (prawy przycisk myszy na linku -> zapisz jako) i przejrzyjcie kod źródłowy danego przykładu :)

### Q: Chcę dodać plik do mojego posta/projektu. Jak to zrobić?
Przechowywanie dużych plików w repozytorium jest dość "upierdliwe". Każdy pull/fetch wymagać będzie od wszystkich osób
 pobierania całego folderu ze wszystkimi plikami, których prawie na pewno nie użyjesz :) Dlatego też... przygotowaliśmy
 osobne repozytorium na takie pliki :) Jak zapewne zauważyłeś w katalogu głównym znajduje się podmoduł gita (ang. submodule).
 Jest to nic innego jak link do innego repozytorium, które znajdziesz [tutaj](https://github.com/jpowie01/GradientPG_Pliki).
 Wystarczy, że zrobisz pull request tak samo jak to robiłeś/-aś podczas dodawania nowego postu.

Plik będzie dostępny na stronie internetowej pod linkiem: [http://gradient.eti.pg.gda.pl/pliki/<ŚCIEŻKA>](http://gradient.eti.pg.gda.pl/pliki/<ŚCIEŻKA>).
 Pliki pobierane są podczas deploymentu, który odpala się o każdej pełnej godzinie, a więc mogą się pojawić na serwerze
 z lekkim opóźnieniem.  

**UWAGA nr1!** Mniejsze pliki (np. zdjęcia do postów) proponujemy trzymać w folderze `assets` w niniejszym repozytorium. Będzie to wygodniejsze :)  
**UWAGA nr2!** Prosimy o zdjęcia JPG o wadze max. 150KB!  

### Q: Jakiej technologii użyliście?
Użyliśmy [Jekylla](http://jekyllrb.com) ze skórką [Centrarium](https://github.com/bencentra/centrarium). Całość jest kompatybilna
 z GitHub Pages, gdzie testowaliśmy całość zanim zahostowaliśmy stronę na serwerach KASKu. Dodatkowo, użyliśmy biblioteki
 [MathJax](http://mathjax.org) oraz [HighlightJS](http://highlightjs.org), żeby dodać trochę życia do HTMLa :)

Warto zapoznać się również z [tym cheatsheetem](https://devhints.io/jekyll), który zawiera wszelkie potrzebne informacje
 o developmencie stron w Jekyllu.

Do internacjonalizacji wykorzystaliśmy plugin "[jekyll-multiple-languages-plugin](https://github.com/Anthony-Gaudino/jekyll-multiple-languages-plugin)",
 który całkiem przyjemnie zapewnia nam obsługę standardu i18n. Po więcej szczegółów zapraszamy do powyższego linka, gdzie
 znajdziesz wszystkie informacje o tym jak z nim pracować.

## Regulamin
1. Każdy Członek Koła ma możliwość uczestnictwa w życiu strony internetowej (w tym publikacji treści).
2. Tylko Administratorzy oraz Zarząd Koła mają możliwość merge'owania kodu do głównego brancha `master`.
3. Każda osoba publikująca treść powinna przetestować swoją publikację na lokalnym komputerze.
4. Publikujący powinien dostosować się do zasad formatowania nazw plików stosowanych w ramach projektu.
5. Niedostosowanie się do powyższych zasad może skutkować odebraniem możliwości kontrybucji.

## Administratorzy
- [Jakub Powierza](mailto:jakub.powierza@icloud.com)
- [Dawid Paluchowski](mailto:paluchowskid@gmail.com)
