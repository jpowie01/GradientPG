---
layout: article-post
locale: pl
title:  "Wprowadzenie do Caffe2"
date:   2017-05-05 10:56:00
author: Jakub Powierza
categories: Publikacje
tags:	wprowadzenie framework
comments: true
cover:  "/assets/posts/2017-05-05-wprowadzenie-do-caffe2/tlo.jpg"
---

Całkiem niedawno, bo kilka tygodni temu na F8 (konferencji Facebooka dla developerów), miała miejsce oficjalna premiera nowej wersji popularnego frameworka Caffe. Jak zacząć z nim pracę?  

### Krótki opis
Caffe2 to framework przygotowany przez Facebooka przy współpracy z Nvidią oraz Intelem. Jest w pełni Open Source'owy, a jego kody znajdziecie na [GitHubie](https://github.com/caffe2/caffe2). Jak (prawie) każdy inny framework jest oparty o backend napisany w C++ z wykorzystaniem OpenMPI w implementacji CPU oraz CUDA dla GPU. Co więcej, Caffe2 zapewnia wsparcie dla konfiguracji multi-GPU oraz multi-node w oparciu o zaimplementowaną obsługę InfiniBand.

![Skalowalność](/assets/posts/2017-05-05-wprowadzenie-do-caffe2/skalowalnosc-1.png)

Facebook upewnił się również, aby framework był wysoce skalowalny. Poniżej umieściłem wykres przedstawiający zależność ilości GPU od wskaźnika skalowalności. Jak widać, framework spisuje się całkiem dobrze i świetnie radzi sobie z zarządzaniem dostępnymi zasobami.

![Skalowalność](/assets/posts/2017-05-05-wprowadzenie-do-caffe2/skalowalnosc-2.png)

### Przygotowanie środowiska
Niestety, ale na chwilę obecną nie ma dostępnych wersji binarnych biblioteki. Musimy ją sobie zbudować ręcznie z pomocą odpowiedniej [instrukcji](https://caffe2.ai/docs/getting-started.html?platform=ubuntu&configuration=compile), choć i to może sprawiać problemy... Osobiście polecam rozwiązanie oparte o Docker Image, który dostępny jest w głównym repozytorium. W tym celu należy odpalić polecenie:

{% highlight shell %}
$ docker pull caffe2ai/caffe2:c2.tutorial.0.7.1
{% endhighlight %}

Uruchomienie w nim Jupyter Notebooka jest całkiem proste i sprowadza się do wywołania polecenia Dockera:
{% highlight shell %}
$ docker run -it -p 8888:8888 caffe2ai/caffe2:latest sh -c "jupyter notebook --no-browser —ip 0.0.0.0 /caffe2/caffe2/python/tutorials"
{% endhighlight %}

I gotowe! Powinieneś być już w stanie posługiwać się Caffe2 bez większych przeszkód. Czas na zapoznanie się z podstawowymi pojęciami oraz metodami, które należy poznać przed rozpoczęciem pracy z tym frameworkiem.

### Workspace
Workspace jest podstawową jednostką przechowującą dane (które zapisane są jako Bloby). Wszelkie pozostałe elementy biblioteki, które będziemy opisywać, będą bazować na właściwościach Workspace'a. Poniższe przykłady pokazują podstawowe operacje, które można na nim wykonać.

- wypisywanie dostępnych danych:
{% highlight python %}
>>> print("Bloby: {}".format(workspace.Blobs()))
Bloby: []
{% endhighlight %}

- sprawdzanie dostępności konkretnego bloba:
{% highlight python %}
>>> print("Istnieje 'X'? {}".format(workspace.HasBlob("X")))
Istnieje 'X'? False
{% endhighlight %}

- wypełnianie Workspace'a danymi:
{% highlight python %}
>>> workspace.FeedBlob("X", np.random.randn(2, 3).astype(np.float32))
>>> print("Bloby: {}".format(workspace.Blobs()))
Bloby: [u'X']

>>> print("Istnieje 'X'? {}".format(workspace.HasBlob("X")))
Istnieje 'X'? True
{% endhighlight %}

- pobieranie konkretnego bloba:
{% highlight python %}
>>> print("Wartosc X:\n{}".format(workspace.FetchBlob("X")))
Wartosc X:
[[ 1.49933279 0.91606504 0.31837222]
 [ 0.3840501  -0.01287393 -0.09028989]]
{% endhighlight %}

Warto zauważyć, że Caffe daje możliwość pracy z wieloma Workspace'ami, pomiędzy którymi możemy się dynamicznie przełączać. W tym celu możemy wykorzystać dodatkowe metody:

- wypisywanie aktualnego Workspace'u:
{% highlight python %}
>>> print("Aktualny workspace: {}".format(workspace.CurrentWorkspace()))
Aktualny workspace: default

>>> print("Bloby: {}".format(workspace.Blobs()))
Bloby: [u'X']
{% endhighlight %}

- przełączanie się na nowy Workspace:
{% highlight python %}
>>> workspace.SwitchWorkspace("gradient_demo", True)
>>> print("Aktualny workspace: {}".format(workspace.CurrentWorkspace()))
Aktualny workspace: gradient_demo

>>> print("Bloby: {}".format(workspace.Blobs()))
Bloby: []
{% endhighlight %}

### Operatory
W Caffe wszystko opiera się o pojęcie operatora. Operator jest niczym innym tylko "cegiełką", z której funkcjonalności i logiki możemy korzystać w dowolnym miejscu naszej struktury sieci (o której będziemy mówić później).  

Jak z niego korzystać? Stosunkowo prosto. Mamy kilka możliwości odwoływania się do operatora. Podstawową metodą jest stworzenie go na podstawie nazwy oraz definicji wejścia/wyjścia:
{% highlight python %}
>>> op = core.CreateOperator(
>>>     "Relu", # Nazwa operatora
>>>     ["X"],  # Lista blobow wejsciowych
>>>     ["Y"],  # Lista blobow wyjsciowych
>>> )
>>> print("Typ operatora: {}".format(type(op)))
>>> print("Zawartosc:\n{}", str(op))
Typ operatora: <class 'caffe2.proto.caffe2_pb2.OperatorDef'>
Zawartosc:
input: "X"
output: "Y"
name: ""
type: "Relu"
{% endhighlight %}

Aby uruchomić dany operator wystarczy odwołać się do aktualnego Workspace'a i wywołać w nim metodę `RunOperatorOnce`.
{% highlight python %}
>>> workspace.RunOperatorOnce(op)
>>> print("Bloby: {}\n".format(workspace.Blobs()))
Bloby: [u'X', u'Y']

>>> print("Wartosc X:\n{}".format(workspace.FetchBlob("X")))
Wartosc X:
[[-1.90759015 -0.22212909  0.8538388 ]
 [ 0.49546063 -1.38485765 -0.05033699]]

>>> print("Wartosc Y:\n{}".format(workspace.FetchBlob("Y")))
Wartosc Y:
[[ 0.          0.          0.8538388 ]
 [ 0.49546063  0.          0.        ]]
{% endhighlight %}

Ręczne wywoływanie operatorów nie będzie zbyt często spotykane. Do budowania naszej struktury będziemy wykorzystywać sieci.

### Sieci
Sieć (ang. Net) jest podstawowym miejscem, w którym będziemy realizować schemat naszej struktury operatorów. Tak połączone operatory będą tworzyć graf (podobny do tego z TensorFlow). Generowanie sieci jest bardzo proste i sprowadza się do utworzenia w niej operatorów, a następnie wskazania między nimi zależności:
{% highlight python %}
net = core.Net("gradient_net")
X = net.GaussianFill([], ["X"], mean=0.0, std=1.0, shape=[2, 3], run_once=0)
W = net.GaussianFill([], ["W"], mean=0.0, std=1.0, shape=[5, 3], run_once=0)
b = net.ConstantFill([], ["b"], shape=[5,], value=1.0, run_once=0)
Y = X.FC([W, b], ["Y"])
{% endhighlight %}

Zanim jednak zabierzemy się za uruchomienie naszej sieci, warto jest zwizualizować sobie ją na grafie. Caffe posiada wbudowaną funkcjonalność, pozwalającą na wygenerowanie odpowiedniej grafiki (umieszczonej poniżej).
{% highlight python %}
from caffe2.python import net_drawer
from IPython import display
graph = net_drawer.GetPydotGraph(net, rankdir="LR")
display.Image(graph.create_png(), width=800)
{% endhighlight %}

![Sieć](/assets/posts/2017-05-05-wprowadzenie-do-caffe2/siec.png)

Nasza sieć jest już gotowa do uruchomienia. Jest to równie proste, co uruchomienie pojedynczego operatora i sprowadza się do wywołania metody `RunNetOnce`.
{% highlight python %}
>>> workspace.ResetWorkspace()
>>> print("Bloby: {}".format(workspace.Blobs()))
Bloby: []

>>> workspace.RunNetOnce(net)
>>> print("Bloby: {}".format(workspace.Blobs()))
Bloby: [u'W', u'X', u'Y', u'b']

>>> for name in workspace.Blobs():
>>>     print("{}:\n{}".format(name, workspace.FetchBlob(name)))
W:
[[ 1.15298831 2.02991176 -0.53879094]
 [ 0.63714212  0.16825198  0.95623571]
 [-0.13984574  1.80930626 -0.43459323]
 [-0.39667347  1.87240088 -0.72185475]
 [ 0.76232553  1.56994569  0.1997031 ]]
X:
[[ 0.84681964  3.25020695  1.22675776]
 [-2.34444427 -1.34224248 -1.98630714]]
Y:
[[ 7.91304064  3.2594676   6.2290554   5.86423874  6.9931879 ]
 [-3.35754633 -2.61895704 -0.23743153  0.85058808 -3.29114914]]
b:
[ 1.  1.  1.  1.  1.]
{% endhighlight %}

A jak przedstawić jakąś większą sieć? Dla przykładu, poniżej zamieszczam fragment kodu implementujący LeNet, którego możemy użyć do MNISTa (pełen przykład na końcu artykułu).
{% highlight python %}
def AddLeNetModel(model, data):
	# Image size: 28x28 -> 24x24
	conv1 = model.Conv(data, 'conv1', dim_in=1, dim_out=20, kernel=5)
	# Image size: 24x24 -> 12x12
	pool1 = model.MaxPool(conv1, 'pool1', kernel=2, stride=2)
	# Image size: 12x12 -> 8x8
	conv2 = model.Conv(pool1, 'conv2', dim_in=20, dim_out=50, kernel=5)
	# Image size: 8x8 -> 4x4
	pool2 = model.MaxPool(conv2, 'pool2', kernel=2, stride=2)
	# 50 * 4 * 4 = dim_out from previous layer * image size
	fc3 = model.FC(pool2, 'fc3', dim_in=50 * 4 * 4, dim_out=500)
	fc3 = model.Relu(fc3, fc3)
	pred = model.FC(fc3, 'pred', 500, 10)
	softmax = model.Softmax(pred, 'softmax')
	return softmax
{% endhighlight %}

A jak taką sieć uczyć? To już historia na inny artykuł. Mimo wszystko, warto zamieścić krótką "ściągę" przydatnych operatorów, których użycie znajdziecie w dołączonym kodzie.
{% highlight python %}
# Zatrzymanie gradientu
Y = Y.StopGradient([], "Y")

# Iteracja
net.Iter(ITER, ITER)

# Learning Rate
LR = net.LearningRate(ITER, "LR", base_lr=-0.1, policy="step", stepsize=20, gamma=0.9)

# Suma = W + grad(W) * LR
net.WeightedSum([W, ONE, gradient_map[W], LR], W)

# Cross entropy
xent = model.LabelCrossEntropy([prediction, label], 'xent')

# Uczenie epokami
for i in range(50):
	workspace.RunNet(net.Proto().name)
{% endhighlight %}

### Podsumowanie
Jak widać, Caffe nie jest takie straszne :) Myślę, że ten wstęp wystarczy, aby rozpocząć z nim pracę. Jeżeli zainteresowałem Cię tym frameworkiem to zapraszam do odnośników poniżej. Dodatkowo, udostępniam moją prezentację z ostatniego spotkania oraz Jupyter Notebook z implementacją MNISTa dla [Kaggle](https://www.kaggle.com/c/digit-recognizer).

#### Przydatne linki
- Dokumentacja: [https://caffe2.ai](https://caffe2.ai)
- Docker: [https://www.docker.com](https://www.docker.com)
- Instalacja: [https://caffe2.ai/docs/getting-started.html](https://caffe2.ai/docs/getting-started.html)
- Tutoriale: [https://caffe2.ai/docs/tutorials](https://caffe2.ai/docs/tutorials)
- GitHub: [https://github.com/caffe2/caffe2](https://github.com/caffe2/caffe2)
- Przykład aplikacji: [https://github.com/bwasti/AICamera](https://github.com/bwasti/AICamera)
- Ciekawy artykuł: [https://www.nextplatform.com/2017/04/19/machine-learning-gets-infiniband-boost-caffe2/](https://www.nextplatform.com/2017/04/19/machine-learning-gets-infiniband-boost-caffe2/)

#### Pliki
- [<i class="fa fa-file-pdf-o" aria-hidden="true"></i> PDF]({{ site.url }}/pliki/pdf/2017-05-05-wprowadzenie-do-caffe2/Wprowadzenie_Caffe2.pdf) - Prezentacja z ostatniego spotkania
- [<i class="fa fa-book" aria-hidden="true"></i> Jupyter Notebook]({{ site.url }}/pliki/ipynb/Caffe2_Digit_Recognizer.ipynb) - Implementacja rozpoznawania cyfr dla [Kaggle](https://www.kaggle.com/c/digit-recognizer)
