Mosquitto: بروکر MQTT روی پورت 1883 اجرا می‌شود.

InfluxDB: پایگاه داده زمانی روی پورت 8086 با دیتابیس sensor_data.

Grafana: برای مصورسازی داده‌ها روی پورت 3000 (با نام کاربری و رمز admin/adminpass).

Data Producer: هر 5 ثانیه داده‌های تصادفی دما و رطوبت تولید و به Mosquitto ارسال می‌کند.

Data Consumer: داده‌ها را از Mosquitto می‌خواند و در InfluxDB ذخیره می‌کند.

برای مصورسازی داده‌ها در Grafana:

    به http://localhost:3000 بروید.

    منبع داده InfluxDB را با آدرس http://influxdb:8086 اضافه کنید.

    یک داشبورد بسازید و داده‌های temperature و humidity را از باکت sensor_data نمایش دهید.



برای اجرا 

docker-compose up --build
