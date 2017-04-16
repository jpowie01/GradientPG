# Gradient - Politechnika Gdańska
Witaj w repozytorium strony internetowej koła naukowego "Gradient". Poniżej zamieściliśmy kilka informacji, które mogą się przydać podczas Twojej kontrybucji. Prosimy Cię o dostosowanie się do panującego regulaminu!

W przypadku problemów śmiało pisz do Administratorów lub Zarządu Koła. Na pewno ktoś Ci pomoże :)

## FAQ
Poniżej zamieszczamy sporą ilość pytań i odpowiedzi, które zapewne będą się pojawiać na bieżąco :)

#### Q: Czego potrzebuje do dodania nowego posta na stronie?
Chęci :)

#### Q: Jak dodać nowy post lub projekt?
Nowy post albo projekt można dodać poprzez utworzenie nowego pliku Markdown (.md/.markdown) w folderze `_posts`. Przykładowe posty i projekty możesz znaleźć w folderze `examples`.

Ważnym jest odpowiednie nazewnictwo pliku! W przeciwnym przypadku silnik strony może nie wykryć Twojej treści. Prosimy o dostosowanie się do przyjętej konwencji nazwenictwa w odpowiednim formacie:
```
[ROK]-[MIESIĄC]-[DZIEŃ]-[tytul-posta-malymi-literami-bez-pl-znakow].markdown
```

#### Q: Jak postawić całą stroną u mnie na komputerze?
Postaraliśmy się, aby stronę można było postawić jak najszybciej oraz jak najwygodniej. Istnieją dwie możliwe drogi, których wybór zależy od Ciebie.

###### Opcja A. Docker Compose (rekomendowane)
Jest to najwygodniejsza możliwa droga do przetestowanie swojej treści u siebie lokalnie. Jak to zrobić:
1. Zainstaluj na swoim komputerze Dockera. Szczegółowe instrukcje znajdziesz na stronie [producenta](https://www.docker.com/community-edition).
2. Sklonuj repozytorium gdzieś u siebie na komputerze:  
```
git clone https://github.com/jpowie01/GradientPG.git
```
3. W folderze ze źródłami użyj polecenia:
```
docker-compose up
```
**UWAGA!** Polecenie za pierwszym razem może chwilę potrwać ze względu na pobranie obrazu z Internetu!
4. Gotowe! Przejdź do swojej przeglądarki i wejdź na stronę `http://127.0.0.1:4000/`. Gdy tylko dodasz swoją treść do kodu - strona powinna zostać automatycznie wygenerowana.

###### Opcja B. Zainstalowanie wszystkiego osobno
Jest to opcja szczerze mówiąc masochistyczna. Wymaga ona instalacji wszystkich składników osobno. Jest to o tyle trudniejsza droga do opisania, gdyż zależy ona od posiadanego systemu operacyjnego.  

Przykładowo - dla Ubuntu należy wykonać następujące kroki:
1. Zainstaluj na swoim komputerze następujące paczki:
```
sudo apt-get install make gcc ruby ruby-dev nodejs
```
2. Zainstaluj następujący pakiet za pomocą Gema:
```
gem install bundler
```
3. Sklonuj repozytorium gdzieś u siebie na komputerze:  
```
git clone https://github.com/jpowie01/GradientPG.git
```
4. W folderze ze źródłami wykonaj następujące polecenie:
```
bundle install
```
5. Następnie uruchom stronę następującym poleceniem:
```
bundle exec jekyll serve
```
6. Gotowe! Przejdź do swojej przeglądarki i wejdź na stronę `http://127.0.0.1:4000/`. Gdy tylko dodasz swoją treść do kodu - strona powinna zostać automatycznie wygenerowana.

Jak widzisz - nie jest to prosta droga. Co więcej, możesz zrobić sobie niezły syf na komputerze. Jest to niestety jedyna droga w przypadku, gdy z jakiejś przyczyny (np. słaby komputer, brak odpowiedniego systemu, itd.) nie jesteś w stanie użyć Dockera.

Pomocne mogą się okazać następujące źródła:
- [dokumentacja Jekylla](https://jekyllrb.com),
- [dokumentacja GitHub Pages](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/).

#### Q: Czy muszę stawiać stronę lokalnie?
Nie, nie musisz. Możesz dodać post poprzez GUI z poziomu GitHuba. Nie będziesz miał jednak możliwości kontroli nad dodawaną treścią oraz nie będziesz mógł upewnić się, że Twoje dzieło będzie wyglądało poprawnie na stronie.  
**Rekomendujemy, aby testować swoje posty i projekty lokalnie!**

#### Q: Jak udostępnić mój post w ramach strony?
Do kontrybucji będziemy wykorzystywać następujący flow:
1. Sklonuj repozytorium gdzieś u siebie na komputerze:  
```
git clone https://github.com/jpowie01/GradientPG.git
```
2. Stwórz brancha, na którym będziesz pracować (proszę o zachowanie konwencji nazewniczej):
```
git checkout -b imie_nazwisko/tytul_posta_lub_projektu
```
3. Zmodyfikuj stronę oraz przetestuj ją lokalnie.
4. Zacommituj swoje zmiany:
```
git add .
git commit -m "Opis wprowadzonych zmian"
```
5. Wyślij swoje zmiany na GitHuba:
```
git push origin imie_nazwisko/tytul_posta_lub_projektu
```
6. Wejdź na GitHuba, a następnie utwórz Pull Request (więcej informacji znajdziesz [tutaj](https://help.github.com/articles/creating-a-pull-request/#creating-the-pull-request)).  

**UWAGA!** Jako, że nasze repozytorium jest prywatne - każdy ma możliwość zmerge'owania swoich zmian do mastera bez przechodzenia etapu review. Prosimy jednak o rozwagę i dostosowanie się do regulaminu repozytorium. Merge'a może dokonać tylko członek Zarządu Koła lub Administrator repozytorium!

#### Q: Nigdy wcześniej nie korzystałem/-am z Gita. Muszę się go uczyć?
Git stał się obecnie najpowszechniejszym narzędziem do kontroli wersji. Prędzej czy później każdy z nas będzie się go musiał nauczyć :)

W Internecie znajduje się mnóstwo kursów, a także interaktywnych tutoriali. Główny workflow zamieściliśmy powyżej - na pewno sobie poradzisz :) W przypadku problemów prosimy o kontakt - spróbujemy pomóc.

#### Q: Kiedy pojawi się mój post na stronie?
Strona aktualizuje się o każdej pełnej godzinie. Staraliśmy się o auto-deployment przy każdym merge'u, ale wymaga to trochę więcej wysiłku... Może pewnego dnia ulepszymy ten proces.

#### Q: Jak dodać kod do mojego projektu?
Aby dodać kod, wystarczy, że użyjesz następującej składni:
```
{% highlight python %}
def demo(arg1, arg2):
	print(arg1 + ', ' + arg2 + '!')

demo('hello', 'world')
{% endhighlight %}
```

#### Q: Jak dodać wzór matmatyczny do mojego projektu?
Na stronie można swobodnie umieszczać wzory matematyczne zapisane w formacie LaTeX. Wystarczy je owinąć w znacznik podwójnego dolara, a reszta zostanie sparsowana auto-magicznie. Biblioteka, którą zainstalowaliśmy powinna także poradzić sobie z innymi formatami.

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

#### Q: Jakiej technologii użyliście?
Użyliśmy [Jekylla](http://jekyllrb.com) ze skórką [Centrarium](https://github.com/bencentra/centrarium). Całość jest kompatybilna z GitHub Pages, gdzie testowaliśmy całość zanim zahostowaliśmy stronę na serwerach KASKu. Dodatkowo, użyliśmy biblioteki [MathJax](http://mathjax.org) oraz [HighlightJS](http://highlightjs.org), żeby dodać trochę życia do HTMLa :)

## Regulamin
1. Każdy Członek Koła ma możliwość uczestnictwa w życiu strony internetowej (w tym publikacji treści).
2. Tylko Administratorzy oraz Zarząd Koła mają możliwość merge'owania kodu do głównego brancha `master`.
3. Każda osoba publikująca treść powinna przetestować swoją publikację na lokalnym komputerze.
4. Publikujący powinien dostosować się do zasad formatowania nazw plików stosowanych w ramach projektu.
5. Niedostosowanie się do powyższych zasad może skutkować odebraniem możliwości kontrybucji.

## Administratorzy
- [Jakub Powierza](mailto:jakub.powierza@icloud.com)
- [Dawid Paluchowski](mailto:paluchowskid@gmail.com)
