# Pet Shop Backend

## Предисловие

В этом форке, буквально 1 изменение: из оригинального столбца в базе SQLite с названием discont_price, здесь я его переименовал в discountPrice, и на то были 2 причины:
1. discont_price банально неграмотно, нет такого слова в языке (а discont можно перепутать с каким-то сокращением, что вызывает путаницу при работе с кодом)
2. названия всех остальных столбцов во всей БД, написаны в camelCase, пока discont_price - это snake_case, т.е. мы противоречим конвенции названий БД

Остальное я оставил без изменений, ниже - оригинальный README

## Описание

Это backend часть проекта интернет-магазина товаров для домашних животных. Он реализует REST API для работы с категориями, продуктами и заказами.

## Структура проекта

- `/database`
  - `/models`
    - `category.js`: Модель категории
    - `product.js`: Модель продукта
  - `database.js`: Настройка подключения к базе данных SQLite
- `/public`
  - `/category_img`: Изображения категорий
  - `/product_img`: Изображения продуктов
- `/routes`
  - `categories.js`: Маршруты для работы с категориями
  - `order.js`: Маршруты для работы с заказами
  - `products.js`: Маршруты для работы с продуктами
  - `sale.js`: Маршруты для работы с продажами
- `index.js`: Главный файл сервера
- `database.sqlite`: Файл базы данных SQLite
- `package.json` и `package-lock.json`: Файлы зависимостей проекта
- `README.md`: Описание проекта

## Установка и запуск

1. Клонируйте репозиторий:

```bash
git clone <URL репозитория>
```

2. Перейдите в папку проекта:

```bash
cd <имя папки проекта>
```

3. Установите зависимости:

```bash
npm install
```

4. Запустите сервер:

```bash
npm run dev
```

Сервер будет запущен и будет слушать запросы на порту 3333.

## Проверка работы API

Вы можете проверить работу API через Postman или браузер.

### Примеры API маршрутов

- Получение всех категорий: `GET /categories/all`
- Получение продуктов по категории: `GET /categories/:id`
- Получение всех продуктов: `GET /products/all`
- Получение продукта по ID: `GET /products/:id`
- Оформление заказа: `POST /order/send`
- Оформление заявки на купон: `POST /sale/send`

### Пример запроса

#### Получение всех категорий

```bash
axios.get('http://localhost:3333/categories/all')
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error(error);
  });
```

#### Оформление заказа

```bash
const orderData = {
  name: "John Doe",
  phone: "1234567890",
  email: "johndoe@example.com",
  products: [
    {
      id: 1,
      quantity: 2
    },
    {
      id: 2,
      quantity: 1
    }
  ]
};

axios.post('http://localhost:3333/order/send', orderData, {
  headers: {
    'Content-Type': 'application/json'
  }
})
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    console.error(error);
  });
```

## Используемые технологии

- Node.js
- Express
- Sequelize
- SQLite
- Cors
- Axios
