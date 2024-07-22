<div align="center">

<a href="https://github.com/jonssonyan/h-ui"><img src="./docs/images/head-cover.png" alt="H UI" width="150" /></a>

<h1 align="center">H UI</h1>

[English](README_EN.md) / [简体中文](README_ZH.md) / فارسی

Just the panel for Hysteria2

پنل Hysteria2

<p>
<a href="https://www.gnu.org/licenses/gpl-3.0.html"><img src="https://img.shields.io/github/license/jonssonyan/h-ui" alt="License: GPL-3.0"></a>
<a href="https://github.com/jonssonyan/h-ui/stargazers"><img src="https://img.shields.io/github/stars/jonssonyan/h-ui" alt="GitHub stars"></a>
<a href="https://github.com/jonssonyan/h-ui/forks"><img src="https://img.shields.io/github/forks/jonssonyan/h-ui" alt="GitHub forks"></a>
<a href="https://github.com/jonssonyan/h-ui/releases"><img src="https://img.shields.io/github/v/release/jonssonyan/h-ui" alt="GitHub release"></a>
<a href="https://hub.docker.com/r/jonssonyan/h-ui"><img src="https://img.shields.io/docker/pulls/jonssonyan/h-ui" alt="Docker pulls"></a>
</p>

![cover](./docs/images/cover.png)

</div>

## امکانات 


- سبک وزن، استفاده کم از منابع، نصب آسان
 - نظارت کامل بر وضعیت سیستم و Hysteria2 
- اعمال محدودیت حجمی ، تاریخ و تعداد دستگاه برای کاربران
 - بازنشانی حجم مصرفی کاربران
- تهیه پشتیبان از کاربران
 - مدیریت تنظیمات Hysteria2 و نسخه های Hysteria2
 - تغییر آسان پورت اتصال و ضریب مصرفی ترافیک
- صفحه نمایش گزارش های سیستم و گزارش‌های Hysteria2
 - پشتیبانی از زبان های انگلیسی، 简体中文
 - طراحی واکنشگرا، پشتیبانی از حالت شب، تم های صفحه سفارشی
 - ویژگی های بیشتر در انتظار شما برای کشف

## سیستم عامل مورد نیاز

CentOS 8+/Ubuntu 20+/Debian 11+

CPU: x86_64/amd64 arm64/aarch64

حافظه : ≥ 256MB

## نصب

### نصب سریع (پیشنهادی)

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/jonssonyan/h-ui/main/install.sh)
```

### Docker

1. نصب داکر

   https://docs.docker.com/engine/install/

   ```bash
   bash <(curl -fsSL https://get.docker.com)
   ```

2. راه اندازی

   ```bash
   docker pull jonssonyan/h-ui

   docker run -d --cap-add=NET_ADMIN \
     --name h-ui --restart always \
     --network=host \
     -v /h-ui/bin:/h-ui/bin \
     -v /h-ui/data:/h-ui/data \
     -v /h-ui/export:/h-ui/export \
     -v /h-ui/logs:/h-ui/logs \
     jonssonyan/h-ui
   ```

   تنظیم پورت پنل (8081 پیشنهادی)

   ```bash
   docker run -d --cap-add=NET_ADMIN \
     --name h-ui --restart always \
     --network=host \
     -v /h-ui/bin:/h-ui/bin \
     -v /h-ui/data:/h-ui/data \
     -v /h-ui/export:/h-ui/export \
     -v /h-ui/logs:/h-ui/logs \
     jonssonyan/h-ui \
     ./h-ui -p 8081
   ```

   تنظیم منطقه زمانی، پیش فرض Asia/Tehran

   ```bash
   docker run -d --cap-add=NET_ADMIN \
     --name h-ui --restart always \
     --network=host \
     -e TZ=Asia/Tehran \
     -v /h-ui/bin:/h-ui/bin \
     -v /h-ui/data:/h-ui/data \
     -v /h-ui/export:/h-ui/export \
     -v /h-ui/logs:/h-ui/logs \
     jonssonyan/h-ui
   ```

حذف پنل

```bash
docker rm -f h-ui
docker rmi jonssonyan/h-ui
rm -rf /h-ui
```

### systemd

دانلود فایل پنل: https://github.com/jonssonyan/h-ui/releases

```bash
mkdir -p /usr/local/h-ui/
curl -fsSL https://github.com/jonssonyan/h-ui/releases/latest/download/h-ui-linux-amd64 -o /usr/local/h-ui/h-ui && chmod +x /usr/local/h-ui/h-ui
curl -fsSL https://raw.githubusercontent.com/jonssonyan/h-ui/main/h-ui.service -o /etc/systemd/system/h-ui.service
# پورت پنل، 8081 پیشنهادی
# sed -i "s|^ExecStart=.*|ExecStart=/usr/local/h-ui/h-ui -p 8081|" "/etc/systemd/system/h-ui.service"
systemctl daemon-reload
systemctl enable h-ui
systemctl restart h-ui
```

حذف پنل

```bash
systemctl stop h-ui
rm -rf /etc/systemd/system/h-ui.service /usr/local/h-ui/
```

## اطلاعات پیشفرض

- پورت پنل : 8081
- نام کاربری و رمز عبور : sysadmin

## بروزرسانی سیستم

ابتدا یک فایل پشتیبان از کاربران تهیه کنید، سپس نسخه جدید را نصب کنید

## داکیومنت

[فارسی > FAQ](./docs/FAQ.md)

## بهینه سازی عملکرد

- میتوانید یک کرون ری استارت تنظیم کنید

    ```bash
    0 4 * * * /sbin/reboot
    ```

- میتوانید یک شتابدهنده شبکه نصب کنید
    - [TCP Brutal](https://github.com/apernet/tcp-brutal) (推荐)
    - [teddysun/across#bbrsh](https://github.com/teddysun/across#bbrsh)
    - [Chikage0o0/Linux-NetSpeed](https://github.com/ylx2016/Linux-NetSpeed)
    - [ylx2016/Linux-NetSpeed](https://github.com/ylx2016/Linux-NetSpeed)

## داکیومنت هیستریا2

https://v2.hysteria.network/zh/docs/getting-started/3rd-party-apps/

## توسعه سیستم

Go >= 1.20, Node.js >= 18.12.0

- frontend

   ```bash
   cd frontend
   pnpm install
   npm run dev
   ```

- backend

   ```bash
   go run main.go
   ```

## ساختن

- frontend

   ```bash
   npm run build:prod
   ```

- backend

  Windows: [build.bat](build.bat)

  Mac/Linux: [build.sh](build.sh)

## یوتوب سازنده سیستم

https://www.youtube.com/@jonssonyan


## تاریخچه ستاره

[![Star History Chart](https://api.star-history.com/svg?repos=jonssonyan/h-ui&type=Date)](https://star-history.com/#jonssonyan/h-ui&Date)

## لایسنس

[GPL-3.0](LICENSE)