# ArtFlutter

![alt text](http://dev.artebiakin.com/source/img-07.png 'ArtFlutter')

## About

ArtFluuter – это простое одноэкранное UI приложение написанное на технологии Flutter. Данная работа это задание конкурса ArtFlutter. Статью и условия можно найти здесь [dou.ua](https://dou.ua/lenta/articles/cross-platform-mobile-development/).


## Global variables

[globalVariables.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/globalVariables.dart) – файл содержащий все цвета приложения, горизонтальные паддинги (используются в AppBar и MainScreen) и основные начертания текста (BusinessСard их не использует).

## Data

### BusinessCard.dart

Модель бизнес карты. [BusinessCard.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/data/BusinessCard.dart).

### Transaction.dart

Модель информации о транзакции. [Transaction.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/data/Transaction.dart).

## Screens

Приложение содержит один экран [MainScreen.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/screens/MainScreen.dart), который является главным.

## Widget

### AppBar

Разметка [MAppBar.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/widgets/MAppBar.dart). Конструктор принимает значение title (название заголовка). Так же содержит виджет [ArrowBack.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/widgets/icons/ArrowBack.dart), который отрисовывет иконку.

![alt text](http://dev.artebiakin.com/source/img-01.png 'AppBar')

### Business card

Разметка [MBusinessСard.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/widgets/MBusinessCard.dart). Конструктор принимает BusinessСard.dart.

![alt text](http://dev.artebiakin.com/source/img-02.png 'Business card')

### Transaction card

Виджет отвечает за отображение транзакции. Конструктор принимает Transaction.
[MTransaction.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/widgets/MTransaction.dart).

![alt text](http://dev.artebiakin.com/source/img-03.png 'Transaction')
Содержит виджет, который отрисовывает [Drop](https://github.com/artebiakin/art_flutter/tree/master/lib/widgets/icons/Drop.dart) иконку.

![alt text](http://dev.artebiakin.com/source/img-04.png 'Drop')

### ListTransaction

Отрисовывает список виджетов Transaction, добавляет градацию по дате, отвечает за изменение цвета иконок.
[MListTransaction.dart](https://github.com/artebiakin/art_flutter/tree/master/lib/widgets/MListTransaction.dart).

![alt text](http://dev.artebiakin.com/source/img-05.png 'ListTransaction')
