# Как собрать LanguaGo

## 1. Подготовка

- Установите Xcode из Mac App Store.
- Создайте бесплатный Apple ID или аккаунт Apple Developer.
- В Xcode откройте `Settings → Accounts` и добавьте Apple ID.

## 2. Создание проекта

1. В Xcode выберите `File → New → Project`.
2. Выберите `iOS → App`.
3. Product Name: `LanguaGo`.
4. Interface: `SwiftUI`.
5. Language: `Swift`.
6. Storage: `None`.
7. Создайте проект в папке репозитория.

## 3. Добавление файлов

Перетащите папку `LanguaGo` из репозитория в навигатор Xcode и включите опцию **Copy items if needed**.

## 4. Запуск

Выберите iPhone 16 Pro или другой симулятор и нажмите `Cmd + R`.

## 5. Публикация

1. Зарегистрируйтесь в Apple Developer Program.
2. В App Store Connect создайте приложение `LanguaGo`.
3. В Xcode выберите команду разработки и уникальный Bundle Identifier.
4. Соберите архив: `Product → Archive`.
5. Загрузите архив в App Store Connect.
6. Отправьте на проверку Apple.

После одобрения Apple вы получите публичную ссылку вида `https://apps.apple.com/app/id…`.
